require 'securerandom'

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,         type: String
  field :email,        type: String
  field :access_token, type: String

  validates_presence_of :name, :email

  before_create :generate_access_token!

  has_many :notes

  private

  def generate_access_token!
    self.access_token = SecureRandom.uuid
  end
end
