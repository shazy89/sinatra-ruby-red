class User < ActiveRecord::Base
    has_many :car_posts
    has_many :create_houseposts
    validates :username, presence: true, uniqueness: true
    has_secure_password
end
