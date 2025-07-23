class Users::Registeration
  include Interactor

  def call
    user = User.new(context.params)

    if user.save
      context.user = user
      context.token = JsonWebToken.encode(user_id: user.id)
    else
      context.fail!(errors: user.errors)
    end
  end

  private

  def register
    User.create
  end
end