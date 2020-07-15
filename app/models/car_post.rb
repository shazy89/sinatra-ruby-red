class CarPost < ActiveRecord::Base
    belongs_to :user
    validates :make, presence: true
    validates :model, presence: true
    validates :price, presence: true
end
