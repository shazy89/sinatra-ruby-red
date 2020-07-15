class CreateCarPosts < ActiveRecord::Migration
  def change
    create_table :car_posts do |t|
      t.string :make
      t.string :model
      t.string :miles
      t.string :year
      t.string :price

      t.timestamps null: false
    end
  end
end
