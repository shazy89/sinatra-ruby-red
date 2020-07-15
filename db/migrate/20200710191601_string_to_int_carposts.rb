class StringToIntCarposts < ActiveRecord::Migration
  def change
    change_column :car_posts, :miles, :integer
    change_column :car_posts, :year,  :integer
    change_column :car_posts, :price, :integer
  end
end
