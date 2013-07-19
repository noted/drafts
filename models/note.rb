class Note
  include Mongoid::Document

  field :title, type: String
  field :text,  type: String

  validates_presence_of :title

  belongs_to :user

  has_and_belongs_to_many :tags
end
