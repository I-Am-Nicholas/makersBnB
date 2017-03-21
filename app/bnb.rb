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

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    redirect ('/')
  end

  run! if app_file == $0

end
