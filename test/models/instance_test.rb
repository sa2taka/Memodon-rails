# == Schema Information
#
# Table name: instances
#
#  id            :integer          not null, primary key
#  client_secret :string
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

require 'test_helper'

class InstanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
