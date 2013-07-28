class NoteUpdate < Mutations::Command
  required do
    model :current_user, class: User
    hash :note do
      string :id
      string :title
      string :text
      array  :tags
    end
  end

  def execute
    n = Note.find(note['id'])

    if current_user.can_update?(n)
      n.update_attributes(
        title: note['title'],
        text:  note['text']
      )
      n.tags = handle_tags!(note['tags'])
      n.save

      return n
    else
      add_error(:current_user, :unauthorized, 'the current user is not authorized to do that')
    end
  end

  def handle_tags!(arr)
    tags = []

    arr.each do |t|
      tag = Tag.where(user_id: current_user, text: t).first

      if tag.nil?
        tag = Tag.new(text: t)
        tag.user = current_user
      end

      tags << tag
    end

    return tags
  end
end
