# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  display     :string
#  username    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  instance_id :integer
#
# Indexes
#
#  index_users_on_instance_id  (instance_id)
#  index_users_on_username     (username)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
