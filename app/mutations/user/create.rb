class UserCreate < Mutations::Command
  required do
    hash :user do
      string :name
      string :email
      string :password
    end
  end

  def execute
    u = User.new(user)

    return u
  end
end
