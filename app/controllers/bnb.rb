require 'sinatra/base'

class BNB < Sinatra::Base

  get '/' do
    "Hello World!"
  end

  run! if app_file == $0
end
