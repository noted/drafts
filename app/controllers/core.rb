Drafts::Web.controllers do
  get :index do
    if current_user.nil?
      render 'index'
    else
      render 'notes/index'
    end
  end
end
