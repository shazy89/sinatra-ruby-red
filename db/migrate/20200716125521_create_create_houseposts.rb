class CreateCreateHouseposts < ActiveRecord::Migration
  def change
    create_table :create_houseposts do |t|
      t.integer :user_id
      t.string :badroom
      t.string :bathroom
      t.string :sqf
      t.string :zip_code
      t.string :price
      t.string :comment
      t.integer :count
      t.string :address
      t.string :city
      t.string :state
      t.string :country

      t.timestamps null: false
    end
  end
end
