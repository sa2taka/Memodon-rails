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

require 'test_helper'

class MemoTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
