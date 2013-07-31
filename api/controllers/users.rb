Drafts::API.controllers :users do
  get :tags, map: '/users/:id/tags', provides: [:json] do
    user = User.find(params[:id])

    tags = []

    if params[:query]
      Tag.where(user_id: user.id, text: Regexp.new(params[:query])).all.each do |tag|
        tags << tag.text
      end
    else
      user.tags.each do |tag|
        tags << tag.text
      end
    end

    {
      user: {
        id: user.id,
        tags: tags
      }
    }.to_json
  end
end
