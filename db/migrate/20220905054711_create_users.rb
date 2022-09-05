class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :username
      t.text :password_digest
      t.text :name
      t.text :email

      t.timestamps
    end
  end
end
