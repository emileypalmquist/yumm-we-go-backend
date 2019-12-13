class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :category
      t.string :location
      t.string :hours
      t.integer :user_id
      t.float :rating
      t.boolean :favorite

      t.timestamps
    end
  end
end
