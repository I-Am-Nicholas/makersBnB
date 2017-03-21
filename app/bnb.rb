ENV["RACK_ENV"] ||= 'development'

require './app/models/database_setup'

require 'sinatra/base'
require 'sinatra/flash'


class BNB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    "Hello World!"
  end

  get '/places/new' do
    erb :'places/new'
  end

  post '/places/new' do
    place = Place.create(name: params[:placename], location: params[:location], description: params[:description], price: params[:price])
    if place.valid?
      redirect '/places'
    else
      flash[:message] = place.errors.full_messages.join(", ")
      redirect '/places/new'
    end
  end

  get '/places' do
    @places = Place.all
    erb :'places/list'
  end
  run! if app_file == $0

end
