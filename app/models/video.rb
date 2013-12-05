class Video < ActiveRecord::Base
  before_save :update_slug

  def update_slug
    self.slug = self.name.parameterize
  end

  def to_param
    self.slug
  end

  def embedded_url
    # if the youtube url is  http://www.youtube.com/watch?v=XwmtNk_Yb2Q
    # convert this to the embedded url of http://www.youtube.com/embed/XwmtNk_Yb2Q
    #self.url.gsub /watch\?v\=/, 'embed/'
    #self.url.gsub /(^.*v=)(.*)(\&.*$)/, 'http://www.youtube.com/embed/\2'
    "http://www.youtube.com/embed/#{url}"
  end
end
