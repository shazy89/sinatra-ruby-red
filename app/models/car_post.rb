class CarPost < ActiveRecord::Base
    belongs_to :user
    validates :make, :model, :price,   presence: true
end    
    

