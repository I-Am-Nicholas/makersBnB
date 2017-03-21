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

  post '/places/new' do
    place = Place.create(name: params[:placename], location: params[:location], description: params[:description], price: params[:price])
    redirect '/places'
  end

  get '/places' do
    @places = Place.all
    erb :'places/list'
  end
  run! if app_file == $0

end
