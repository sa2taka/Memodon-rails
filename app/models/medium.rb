# == Schema Information
#
# Table name: media
#
#  id          :integer          not null, primary key
#  preview_url :string
#  type        :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  memo_id     :integer
#
# Indexes
#
#  index_media_on_memo_id  (memo_id)
#

class Medium < ApplicationRecord
  belongs_to :memo

  validates :url, presence: true
  validates :preview_url, presence: true
  validates :type, presence: true
  validates :memo_id, presence: true
end
