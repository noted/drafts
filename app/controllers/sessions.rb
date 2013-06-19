Drafts::Web.controller :sessions do
  get '/auth/:provider/callback' do
    auth = request.env['omniauth.auth']
    user = User.where(:uid => auth['uid'], :provider => auth['provider']) || User.omniauth!(auth)
    session[:drafts] = user.id
    redirect url(:index)
  end
end
