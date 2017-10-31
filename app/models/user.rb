require 'securerandom'

class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email
  validates :password, confirmation: true, presence: true

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      provider: auth[:provider],
      uid: auth[:uid],
      email: auth[:info][:email],
      name: auth[:extra][:raw_info][:name],
      token: auth[:credentials][:token],
      password: SecureRandom.hex(32),
      refresh_token: auth[:credentials][:refresh_token],
      oauth_expires_at: auth[:credentials][:expires_at]
    }
    user.save!
    user
  end
end
