class NoteCreate < Mutations::Command
  required do
    model :current_user, class: User
    hash  :note do
      string :title
      string :text, empty: true, nils: true
      array  :tags, empty: true, nils: true
    end
  end

  def execute
    n = Note.new(
      title: note['title'],
      text:  note['text']
    )

    n.tags = handle_tags!(note['tags'])

    current_user.notes << n
    n.save

    return n
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
