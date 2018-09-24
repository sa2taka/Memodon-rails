# == Schema Information
#
# Table name: memos
#
#  id         :integer          not null, primary key
#  text       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status_id  :bigint
#  user_id    :integer
#
# Indexes
#
#  index_memos_on_status_id  (status_id)
#  index_memos_on_user_id    (user_id)
#

class Memo < ApplicationRecord
  belongs_to :user

  has_many :media, dependent: :destroy
  has_many :memo_tags, dependent: :destroy
  has_many :tags, through: :memo_tags

  accepts_nested_attributes_for :memo_tags
  accepts_nested_attributes_for :tags

  validates :text, presence: true
  validates :user_id, presence: true
  validates :status_id, presence: true
  validates :url, presence: true
end
