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

require 'test_helper'

class MemoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
