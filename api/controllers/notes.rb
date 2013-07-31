Drafts::API.controllers :notes do
  patch :update, provides: [:json] do
    if params[:note][:tags].blank?
      params[:note][:tags] = []
    else
      params[:note][:tags] = params[:note][:tags].split(',')
    end

    note = NoteUpdate.run({
      current_user: User.find(params[:current_user]),
      note: params[:note]
    })

    if note.success?
      {
        note: {
          id: note.result.id,
          title: note.result.title,
          text: note.result.text,
          html: note.result.html,
          tags: note.result.tags_as_arr
        }
      }.to_json
    else
      status 400
      {
        error: note.errors.symbolic
      }.to_json
    end
  end
end
