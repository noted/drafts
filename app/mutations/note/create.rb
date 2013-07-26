class NoteCreate < Mutations::Command
  required do
    model :current_user, class: User
    hash  :note do
      string :title
      string :text
      array  :tags
    end
  end

  def execute
    n = Note.new(
      title: note['title'],
      text:  note['text']
    )

    tags = []
    note['tags'].each do |t|
      tag = Tag.where(user_id: current_user, text: t).first

      if tag
        tags << tag
      else
        tag = Tag.new(text: t)
        tag.user = current_user

        tags << tag
      end
    end

    n.tags = tags
    n.save

    return n
  end
end
