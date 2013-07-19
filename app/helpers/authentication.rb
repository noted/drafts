Drafts::Web.helpers do
  def authorized?
    unless current_user
      redirect url(:sessions, :new)
    end
  end

  def current_user
    @current_user ||= User.where(access_token: params[:drafts]).first
    @current_user
  end
end
