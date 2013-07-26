Drafts::Web.controllers :notes do
  get :index do
  end

  get :new do
  end

  get :view, map: '/n/:id' do
    @note = Note.find(params[:id])

    render 'notes/view'
  end

  patch :update do
  end
end
