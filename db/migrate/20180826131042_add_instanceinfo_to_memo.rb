class AddInstanceinfoToMemo < ActiveRecord::Migration[5.2]
  def change
    add_column :memos, :status_id, :bigint
    add_index :memos, :status_id
    add_column :memos, :url, :string
  end
end
