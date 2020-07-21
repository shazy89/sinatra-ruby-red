class HousepostsController < ApplicationController
    use Rack::Flash

    get "/houses" do 
        erb :houses
    end


    post "/post/new" do 
     current_user
     @newhousepost = @user.create_houseposts.build(params)
     if  @newhousepost.save
         redirect '/userpage'
     else 
          redirect '/create/new/house'
     end
 end
  
 get "/house/:id" do
     find_house_post
     if current_user
         erb :"userpage" 
     else 
         redirect '/'
     end
 end
     
  get "/house/:id/edit" do  
        current_user
        find_house_post
        if logged_in? && current_user == @findhouse.user 
            erb :"house/edit"
        else
            redirect '/'
      end
   end    
     
 patch "/house/:id" do      
       find_house_post
    if current_user == @findhouse.user && update_post
       redirect "/house/#{@findhouse.id}"
     else 
      redirect '/'
     end
 end

 delete '/house/:id' do 
     find_house_post
     if current_user == @findhouse.user
         @findhouse.destroy
     end
     redirect '/userpage'
  end
  
  private
  def find_house_post
      @findhouse = CreateHousepost.find_by_id(params[:id])
  end
  
  def update_post
          @findhouse.update(badroom: params[:house][:badroom],
          bathroom: params[:house][:bathroom], sqf: params[:house][:sqf], zip_code: params[:house][:zip_code],
          price: params[:house][:price],comment: params[:house][:comment],address: params[:house][:address],city: params[:house][:city],
          state: params[:house][:state],country: params[:house][:country])
  end
end       
          
    
        

   
       



  


         
    
