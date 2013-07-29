Drafts::Web.controllers :users do
  get :new, map: '/join' do
    render 'users/new'
  end

  post :create do
    user = UserCreate.run({
      user: params[:user]
    })

    if user.success?
      session[:drafts] = user.result.access_token
      flash[:notice] = 'Welcome to Drafts!'
      redirect url(:index)
    else
      flash[:error] = user.errors.message_list
      redirect url(:users, :new)
    end
  end
end
