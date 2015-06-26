class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :street1, null: false
      t.string :street2, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.text :description
      t.integer :category_id
    end
  end
end
