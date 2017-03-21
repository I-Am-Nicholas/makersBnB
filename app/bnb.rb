ENV["RACK_ENV"] ||= 'development'

require './app/models/database_setup'

require 'sinatra/base'


class BNB < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'

  get '/' do
    erb :'index/index'
  end

  get '/places/new' do
    erb :'places/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name],
                password: params[:password],
                # confirm_password to be included
                email: params[:email])
    session[:user_id] = user.id
    redirect ('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0

end
