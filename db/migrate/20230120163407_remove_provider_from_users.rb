class RemoveProviderFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :provider, :text
  end
end
