class SessionsController < ApplicationController
    use Rack::Flash
    
       get '/login' do
        if !logged_in?
           erb :'user/login'
        else  
           redirect '/'
        end 
      end
      
      post '/user/login' do 
          @user = User.find_by_username(params[:username])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect '/userpage'
         else 
          
          flash.now[:error] = ["Username or password didn't match"]
      
          erb :'user/login'
         end
        end  
        
        get '/logout' do
         session.clear
         flash[:notice] = "You have successfully logged out"
         redirect '/'
       end
      end      
         

          
        
      
        

      
