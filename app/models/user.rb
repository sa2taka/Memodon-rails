# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  display     :string
#  is_first    :boolean          default(TRUE), not null
#  username    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :integer
#  instance_id :integer
#
# Indexes
#
#  index_users_on_account_id   (account_id)
#  index_users_on_instance_id  (instance_id)
#  index_users_on_username     (username)
#

class User < ApplicationRecord
  belongs_to :instance

  has_many :memos, dependent: :destroy

  validates :username, presence: true
  validates :instance_id, presence: true
  validates :account_id, presence: true
end
