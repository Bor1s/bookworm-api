class User < ApplicationRecord
  has_secure_password

  def jwt_token
    payload = { data: email }
    JWT.encode payload, 'gandalf-rules', 'HS256'
  end
end
