class AddIndexUrlToInstance < ActiveRecord::Migration[5.2]
  def change
    add_index :instances, :url
  end
end
