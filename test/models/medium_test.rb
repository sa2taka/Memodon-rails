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

require 'test_helper'

class MediumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
