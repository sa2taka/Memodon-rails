class AddCrawlInfoToInstance < ActiveRecord::Migration[5.2]
  def change
    add_column :instances, :is_crawling, :boolean, default: false, null: false
    add_column :instances, :last_crawl, :timestamp
  end
end
