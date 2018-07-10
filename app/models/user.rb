class User < ApplicationRecord
  has_secure_password

  def self.generate_api_key
    [*('a'..'z'),*('0'..'9')].shuffle[0,20].join
  end
end
