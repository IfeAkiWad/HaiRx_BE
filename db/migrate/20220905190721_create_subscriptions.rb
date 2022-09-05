class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :product_id
      t.text :frequency

      t.timestamps
    end
  end
end
