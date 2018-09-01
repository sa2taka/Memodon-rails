class CreateMemoTags < ActiveRecord::Migration[5.2]
  def change
    create_table :memo_tags do |t|
      t.belongs_to :memo, foreign_key: true
      t.belongs_to :tag, foreign_key: true

      t.timestamps
    end
  end
end
