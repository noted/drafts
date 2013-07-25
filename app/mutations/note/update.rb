class NoteUpdate < Mutations::Command
  required do
    model :current_user, class: User
    hash :note do
      string :id
      string :title
      string :text
    end
  end

  def execute
    n = Note.find(note['id'])

    if current_user.can_update?(n)
      n.update_attributes(note)
      n.save

      return n
    else
      add_error(:current_user, :unauthorized, 'the current user is not authorized to do that')
    end
  end
end
