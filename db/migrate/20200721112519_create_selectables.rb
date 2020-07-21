class CreateSelectables < ActiveRecord::Migration
  def change
    create_table :selectables do |t|
      t.string :states
      t.string :model
      t.string :make

      t.timestamps null: false
    end
  end
end
