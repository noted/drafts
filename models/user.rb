require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include BCrypt

  field :email,         type: String
  field :password_hash, type: String

  validates_presence_of :email

  def self.authenticate(e, p)
    u = where(:email => e).first if e.present?
    u && u.password == p ? u : nil
  end

  def password
    @password ||= Password.create(self.password_hash)
  end

  def password=(str)
    self.password_hash = @password
  end
end
