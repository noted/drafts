require 'bcrypt'
require 'securerandom'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include BCrypt

  attr_accessor :password

  field :name,         type: String
  field :email,        type: String
  field :access_token, type: String
  field :crypted_password, type: String

  validates_presence_of :name, :email

  before_create :generate_access_token!
  before_save :encrypt_password!

  has_many :notes

  def self.authenticate(e, p)
    u = User.where(email: e).first
    u && Password.new(u.crypted_password) == p ? u : nil
  end

  private

  def generate_access_token!
    self.access_token = SecureRandom.uuid
  end

  def encrypt_password!
    self.crypted_password = Password.create(@password)
  end
end
