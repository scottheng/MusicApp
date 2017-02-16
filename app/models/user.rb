class User < ActiveRecord::Base
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: {message: "Password can't be empty"}
  # validates :password, length: {minimum: 8, allow_nil: true}


end
