Drafts::Web.controllers do
  get :index do
    if current_user.nil?
      render 'core/index'
    else
      @notes = Note.desc(:updated_at).where(user_id: current_user.id).all

      render 'notes/index'
    end
  end

  get :ui do
    render 'core/ui'
  end
end
