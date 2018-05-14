class User < ApplicationRecord
  enum status: ['inactive', 'active']
end
