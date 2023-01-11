class RemoveNameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :name, :text
  end
end
