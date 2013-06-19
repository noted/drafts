class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :uid,      type: String
  field :provider, type: String
  field :email,    type: String

  validates_presence_of :uid, :provider, :email

  def self.omniauth!(auth)
    create! do |user|
      user.uid      = auth['uid']
      user.provider = auth['provider']
      user.email    = auth['info']['email']
    end
  end
end
