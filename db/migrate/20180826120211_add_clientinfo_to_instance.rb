class AddClientinfoToInstance < ActiveRecord::Migration[5.2]
  def change
    add_column :instances, :client_id, :string
    add_column :instances, :client_secret, :string
  end
end
