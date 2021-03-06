# == Schema Information
#
# Table name: instances
#
#  id            :integer          not null, primary key
#  client_secret :string
#  is_crawling   :boolean          default(FALSE), not null
#  last_crawl    :datetime
#  title         :string
#  url           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  client_id     :string
#
# Indexes
#
#  index_instances_on_url  (url)
#

class Instance < ApplicationRecord
  has_many :users, dependent: :destroy

  accepts_nested_attributes_for :users

  validates :url, presence: true
end
