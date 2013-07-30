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

  get :edit, map: '/account' do
    render 'users/edit'
  end

  patch :update do
    user = UserUpdate.run({
      current_user: current_user,
      user: params[:user]
    })

    if user.success?
      flash[:notice] = 'Your account has been saved.'
      redirect url(:users, :edit)
    else
      flash[:error] = user.errors.symbolic
      redirect url(:users, :edit)
    end
  end

  delete :destroy do
    user = UserDestroy.run({
      current_user: current_user,
      user: params[:user]
    })

    if user.success?
      session[:drafts] = nil
      flash[:notice] = 'Sorry to see you go!'
      redirect url(:index)
    else
      flash[:error] = user.errors.symbolic
      redirect url(:users, :edit)
    end
  end
end
