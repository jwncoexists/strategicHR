

class Video < ActiveRecord::Base

  belongs_to :section
  before_save :update_slug

  def update_slug
    self.slug = self.name.parameterize
    self.youtube_id = self.ytid
  end

  def to_param
    self.slug
  end

  def course
    s = Section.where(video_id: self.id).first
    if (s)
      Course.find(s.course_id)
    else
      nil
    end
  end

  def ytid
    # if the youtube url is  http://www.youtube.com/watch?v=XwmtNk_Yb2Q
    # convert this to the embedded url of http://www.youtube.com/embed/XwmtNk_Yb2Q
    #self.url.gsub /watch\?v\=/, 'embed/'
    #self.url.gsub /(^.*v=)(.*)(\&.*$)/, 'http://www.youtube.com/embed/\2'
    #{}"http://www.youtube.com/embed/#{url}"
    youtube_id = ""
    url = self.url
    if url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    youtube_id
  end
end
