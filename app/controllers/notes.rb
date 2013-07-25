Drafts::Web.controllers :notes do
  get :index do
  end

  get :new do
    note = Note.new(title: 'Untitled')
    note.user = current_user

    if note.save
      redirect url(:notes, :view, id: note.id)
    else
      flash[:error] = 'Something went wrong.'
      redirect url(:index)
    end
  end

  get :view, map: '/n/:id' do
    @note = Note.find(params[:id])

    render 'notes/view'
  end

  patch :update do
  end
end
