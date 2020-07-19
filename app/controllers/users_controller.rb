
class UserController < ApplicationController
  use Rack::Flash

     get '/signup' do
      if !logged_in?
       erb :'user/signup'
      else
        redirect '/'
      end
     end  
 
     post '/signup' do
        @user = User.new(params[:user])
     if @user.save 
        session[:user_id] = @user.id
        redirect '/login'
     else 
      flash.now[:error] = ["invalid username"]
      erb :'user/signup'
     end
   end

   get '/user/edit' do
     current_user
    if logged_in?
       erb :"user/useredit" 
    else 
      redirect '/'
    end
   end   

   patch '/user/edit' do
     current_user
     if logged_in? && update_user_info
       redirect "/userpage"
     else 
       redirect '/'
    end
   end     
       
   private
   def update_user_info
     @user.update(firstname: params[:user][:firstname], 
     lastname: params[:user][:lastname], contact: params[:user][:contact])
   end
end    
   
   
   
   
   

      
  


  




