Drafts::Web.controllers do
  get :index do
    if current_user.nil?
      render 'core/index'
    else
      @notes = current_user.notes

      render 'notes/index'
    end
  end
end
