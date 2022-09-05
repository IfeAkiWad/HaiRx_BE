class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.text :name
      t.text :brand
      t.text :product_type

      t.timestamps
    end
  end
end
