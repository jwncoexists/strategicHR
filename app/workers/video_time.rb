class VideoTime
  @queue = :youtube_queue

  def self.perform(user_id, video_url, status, curtime)
    # add an entry to the log table for this event
    curlog = Log.create(user_id: user_id, url: video_url, status: status, time: curtime)

    # update user time stats for the course if they stopped the video
    return if status != "stop"
    prevlog = Log.where(user_id: user_id, url: video_url, status: "start", 
                        tracked: false).order("created_at desc").first
    return if prevlog.nil?
    youtube_url = video_url
    youtube_url[/^.*feature=player_embedded.*v=(.*$)/]
    youtube_id = $1
    video = Video.find_by_youtube_id(youtube_id)
    section = Section.where(video_id: video.id).first
    # Rails.logger.debug("Updating logged video time: #{curlog.time} - #{prevlog.time}")
    total = curlog.time - prevlog.time
    course_stat = Stat.where(user_id: user_id, course_id: section.course_id).first
    # if already a stat record, just update it. Otherwise create it
    if course_stat.nil?
      course_stat = Stat.create(user_id: user_id, course_id: section.course_id, total_time: total)
    else
      total = total + course_stat.total_time
      course_stat.update_attribute(:total_time, total)   
    end
    # now update the tracked attribute
    prevlog.update_attribute(:tracked, true) 
  end
end