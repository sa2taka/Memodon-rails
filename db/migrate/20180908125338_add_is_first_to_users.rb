class AddIsFirstToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_first, :boolean, default: true, null: false
  end
end
