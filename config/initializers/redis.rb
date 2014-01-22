# got an error with the following when pushing to heroku
# uri = URI.parse(ENV["REDISTOGO_URL"])
uri = URI.parse("redis://redistogo:132bb4931d798e5199e5ab3dfe085137@grideye.redistogo.com:9741/")
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)