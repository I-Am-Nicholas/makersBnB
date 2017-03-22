ENV["RACK_ENV"] ||= 'development'

require './app/models/database_setup'
require 'sinatra/base'
require 'sinatra/flash'

class BNB < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

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
    if params.has_value?('')
      flash.now[:notice] = "Empty field: please check sign up form and try again"
      erb :'/users/new'
    else
      user = User.create(name: params[:name],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation],
                  email: params[:email])
      session[:user_id] = user.id
      redirect '/'
    end
  end



  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash.now[:notice] = "Incorrect email or password: Please try again"
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "goodbye!"
    redirect to '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0

end
