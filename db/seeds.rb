require 'pry'
require 'json'
require 'rest-client'

class API 
     
BASE_URL = "https://gist.githubusercontent.com/mshafrir/2646763/raw/8b0dbb93521f5d6889502305335104218454c2bf/states_hash.json"

    def states
        response = RestClient.get(BASE_URL)
        data = JSON.parse(response)
        data.values.each do |value| Selectable.create(states: value )    
        end 
    end    
end    

    Selectable.create(make: "Acura")
    Selectable.create(make: "BMW")
    Selectable.create(make: "Honda")
    Selectable.create(make: "Ford")
    Selectable.create(make: "Bentley")
    Selectable.create(make: "Buick")
    Selectable.create(make: "Cadilac")
    Selectable.create(make: "Mercedes")
    Selectable.create(make: "Audi")
    Selectable.create(make: "Lexus")

   
 
      
