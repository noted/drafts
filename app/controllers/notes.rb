Drafts::Web.controllers :notes do
  get :index do
  end

  get :new do
    note = NoteCreate.run({
      current_user: current_user,
      note: {
        title: 'Untitled',
        text:  '',
        tags:  []
      }
    })

    if note.success?
      redirect url(:notes, :show, id: note.result.id)
    else
      flash[:error] = note.errors.message_list
      redirect url(:index)
    end
  end

  get :show, map: '/n/:id' do
    @note = Note.find(params[:id])

    if current_user.can_view?(@note)
      render 'notes/show'
    else
      redirect url(:index)
    end
  end

  patch :update do
    @note = Note.find(params[:note][:id])

    NoteUpdate.run({
      current_user: current_user,
      note: params[:note]
    })
  end
end
