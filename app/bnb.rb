ENV["RACK_ENV"] ||= 'development'

require './app/models/database_setup'
require 'sinatra/base'
require 'sinatra/flash'

class BNB < Sinatra::Base
  enable :sessions, :method_override
  set :sessions_secret, 'super secret'

  register Sinatra::Flash

  get '/' do
    erb :'index/index'
  end

  get '/places/new' do
    erb :'places/new'
  end

   post '/places/new' do
    place = Place.create(name: params[:placename], location: params[:location], description: params[:description], price: params[:price], date_from: params[:date_from], date_to: params[:date_to], user_id: current_user.id)
      if place.valid?
        redirect '/places'
      else
        flash[:message] = place.errors.full_messages.join(", ")
        redirect '/places/new'
      end
    end

   get '/places' do
      @places = Place.all(:order => [ :id.desc ])
      erb :'places/list'
    end

    get '/places/:place_id' do
      @place = Place.first(:id => params[:place_id])
      session[:place_id] = params[:place_id]
      erb :'booking/new'
    end

    post'/bookings/new' do
      booking = Booking.create(current_user_email: params[:current_user_email], owner_email: current_place.user.email, date_from: params[:book_from], date_to: params[:book_to], message: params[:message], user_id: current_user.id, place_id: current_place.id )
      if booking.valid?
        "Hello"
      else
        flash[:message] = booking.errors.full_messages.join(", ")
        redirect '/places'
      end
    end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                email: params[:email])
    if @user.valid?
      session[:user_id] = @user.id
      redirect '/places'
    else
      flash.now[:notice] = @user.errors.full_messages.flatten.join(',')
      erb :'users/new'
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
    def current_place
      @current_place ||= Place.get(session[:place_id])
    end
  end

  run! if app_file == $0

end
