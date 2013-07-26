Drafts::Web.controllers :users do
  get :new, map: '/join' do
    render 'users/new'
  end

  post :create do
  end
end
