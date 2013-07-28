class UserCreate < Mutations::Command
  required do
    hash :user do
      string :name
      string :email
      string :password
    end
  end

  def execute
    password = user['password']
    user.delete('password')

    u = User.new(user)
    u.password = password
    u.save

    return u
  end
end
