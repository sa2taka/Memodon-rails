# == Schema Information
#
# Table name: memos
#
#  id         :integer          not null, primary key
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_memos_on_user_id  (user_id)
#

class Memo < ApplicationRecord
  belongs_to :user

  has_many :medium

  validates :text, presence: true
  validates :user_id, presence: true
end
