Padrino.configure_apps do
  enable :sessions

  set :session_secret, '7f5f22c6d0aea0af20d0a9c77f893ee09114fc6346a56d5455e4aa539f1dd4f9'
end

Padrino.mount('Drafts::Web', :app_file => Padrino.root('app/app.rb')).to('/')
Padrino.mount('Drafts::API', :app_file => Padrino.root('api/app.rb')).to('/api')
