class RowContactNumber < ActiveRecord::Migration
  def change
    add_column :car_posts, :owner_id, :integer
  end
end
