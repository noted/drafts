class NoteCreate < Mutations::Command
  required do
    model :current_user, class: User
    hash  :note do
      string :title
      string :text
    end
  end

  def execute
    n = Note.new(note)
    n.save

    return n
  end
end
