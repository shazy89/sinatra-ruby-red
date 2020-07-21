require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, "password_security"
  end
  use Rack::Flash

get "/" do
    car_posts
    erb :welcome
end 
 
get "/cars" do
  car_posts
  erb :cars
end

get "/houses" do
  house_posts
 
  erb :houses
end
    
helpers do
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @user = User.find_by_id(session[:user_id])
  end

  def create_post
    @newpost = CarPost.create(params)
  end

  def car_posts
    @all = CarPost.all
  end

  def house_posts
    CreateHousepost.all
  end

  def slectables
    @selectable = Selectable.all
  end


 end
end     
  
               
  
   
  
  
  
  
      
    

    

  



