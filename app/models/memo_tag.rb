# == Schema Information
#
# Table name: memo_tags
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  memo_id    :integer
#  tag_id     :integer
#
# Indexes
#
#  index_memo_tags_on_memo_id  (memo_id)
#  index_memo_tags_on_tag_id   (tag_id)
#

class MemoTag < ApplicationRecord
  belongs_to :memo
  belongs_to :tag
end
