Drafts::Web.controller :sessions do
  get :new, map: '/login' do
    render 'sessions/new', layout: false
  end

  post :create do
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:drafts] = user.access_token

      redirect url(:index)
    else
      flash[:error] = 'Incorrect email/password combination.'
      redirect url(:sessions, :new)
    end
  end

  get :destroy, map: '/logout' do
    session[:drafts] = nil

    redirect url(:idnex)
  end
end
