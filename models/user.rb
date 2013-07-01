require 'securerandom'

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :uid,          type: String
  field :provider,     type: String
  field :email,        type: String
  field :access_token, type: String

  validates_presence_of :uid, :provider, :email

  before_create :generate_access_token!

  def self.omniauth!(auth)
    create! do |user|
      user.uid      = auth['uid']
      user.provider = auth['provider']
      user.email    = auth['info']['email']
    end
  end

  private

  def generate_access_token!
    self.access_token = SecureRandom.uuid
  end
end
