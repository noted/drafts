class Note
  include Mongoid::Document
  include Mongoid::Timestamps
  include Canable::Ables

  field :title, type: String
  field :text,  type: String

  validates_presence_of :title

  belongs_to :user

  has_and_belongs_to_many :tags

  def tags_as_arr
    arr = []

    self.tags.each do |tag|
      arr << tag.text
    end

    arr
  end

  def tags_as_str
    str = ''

    self.tags.each do |tag|
      str << tag.text

      unless self.tags.last == tag
        str << ','
      end
    end

    str
  end

  def html
    if self.text
      Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true).render(self.text)
    end
  end

  def viewable_by?(u)
    self.user == u
  end

  def updatable_by?(u)
    self.viewable_by?(u)
  end

  def destroyable_by?(u)
    self.viewable_by?(u)
  end
end
