ENV["RACK_ENV"] ||= 'development'

require './app/models/database_setup'

require 'sinatra/base'


class BNB < Sinatra::Base

  get '/' do
    "Hello World!"
  end

 get '/places/new' do
   erb :'places/new'
 end


  run! if app_file == $0

end