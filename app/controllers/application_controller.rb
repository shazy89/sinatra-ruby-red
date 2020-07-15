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
      all_posts
      erb :welcome
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

    def all_posts
      @all = CarPost.all
    end 
                 
     
  end
end     
    
      
    

    

  



