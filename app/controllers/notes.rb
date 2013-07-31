Drafts::Web.controllers :notes do
  get :index do
    redirect url(:index)
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

  delete :destroy do
    note = NoteDestroy.run({
      current_user: current_user,
      note: params[:note]
    })

    if note.success?
      redirect url(:index)
    else
      flash[:error] = note.errors
      redirect url(:index)
    end
  end
end
