class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :type
      t.string :url
      t.string :preview_url
      t.belongs_to :memo, foreign_key: true

      t.timestamps
    end
  end
end
