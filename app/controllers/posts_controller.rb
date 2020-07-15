class PostsController < ApplicationController
    use Rack::Flash

    get "/userpage" do
        current_user 
        find_post
         if logged_in?
         erb :userpage
         else
       
           redirect '/'
         end
       end
    
    get '/user/create' do
        current_user
        @post = CarPost.new
        if current_user
          erb :'user/newpost'
        else 
          
          redirect '/'
        end
    end

    post '/posted' do
        @newpost = current_user.car_posts.build(params)
       if @newpost.save
          redirect '/userpage'
       else 
          redirect '/user/create'
        end     
    end 
    

    get '/posts/:id' do
           find_post
        if current_user == @findpost.user && logged_in?
          erb :"userpage" 
        else
            redirect '/'
         end
      end   
            


     get '/posts/:id/edit' do
        find_post
        current_user
        if current_user == @findpost.user
        erb :"/user/postedit"
        else
            redirect '/'
        end
      end 
      
      patch '/posts/:id' do
        find_post
        if current_user == @findpost.user && update_post
            redirect "/posts/#{@findpost.id}"
        else 
        redirect '/'
        end
      end    

       delete '/posts/:id' do
        find_post
        if current_user == @findpost.user
            @findpost.destroy
        end
            redirect '/userpage'
        end  
       

            
        private
        def update_post
          @findpost.update(model: params[:car][:model],
          make: params[:car][:make], miles: params[:car][:miles], year: params[:car][:year],
          price: params[:car][:price])
        end
  
        def find_post
            @findpost = CarPost.find_by_id(params[:id])
        end
             
          
 end         
               
      

    
     
     


     

     
    
    
        
       

  
    



        
     
    


