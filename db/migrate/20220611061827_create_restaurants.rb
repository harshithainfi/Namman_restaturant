class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :owner_id
      t.string :status
      t.timestamps
    end
  end
end
