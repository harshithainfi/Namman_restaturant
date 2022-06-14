class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :review
      t.integer :rating
      t.integer :owner_id
      t.string :owner_type

      t.timestamps
    end
  end
end
