class AddUserIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_id, :integer
    add_index :users, :user_id
  end
end
