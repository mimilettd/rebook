require 'securerandom'

class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email, :on => :create
  validates :password, confirmation: true, presence: true, :on =>
:create

  enum subscription_type: { trial: 0, active: 1, inactive: 2 }

  has_many :loans
  has_many :books, through: :loans

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

  def already_checked_out?
    loans.where(return_status: "checked_out").any?
  end

end
