class UserToken < ApplicationRecord
  validates_presence_of :user_id, :token
  validates_uniqueness_of :user_id, :token
end
