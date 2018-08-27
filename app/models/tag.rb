# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  memo_id    :integer
#
# Indexes
#
#  index_tags_on_memo_id  (memo_id)
#  index_tags_on_name     (name)
#

class Tag < ApplicationRecord
  belongs_to :memo

  validates :name, presence: true
end
