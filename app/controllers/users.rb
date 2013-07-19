Drafts::Web.controllers :users do
  get :new, map: '/join' do
    render 'users/new'
  end

  post :create do
    user = User.new(params[:user])

    if user.save
      session[:drafts] = user.access_token

      redirect url(:index)
    else
      redirect url(:users, :new)
    end
  end
end
