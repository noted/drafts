require 'bcrypt'
require 'securerandom'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include BCrypt
  include Canable::Ables
  include Canable::Cans

  attr_accessor :password

  field :name,         type: String
  field :email,        type: String
  field :access_token, type: String
  field :crypted_password, type: String

  validates_presence_of :name, :email

  before_create :generate_access_token!
  before_save :encrypt_password!

  has_many :notes
  has_many :tags

  def self.authenticate(e, p)
    u = User.where(email: e).first
    u && Password.new(u.crypted_password) == p ? u : nil
  end

  def viewable_by?(u)
    self == u
  end

  def updatable_by?(u)
    self.viewable_by?(u)
  end

  def destroyable_by?(u)
    self.viewable_by?(u)
  end

  private

  def generate_access_token!
    self.access_token = SecureRandom.uuid
  end

  def encrypt_password!
    self.crypted_password = Password.create(@password)
  end
end
