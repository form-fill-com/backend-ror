class Users::Login
  include Interactor

  def call
    validate

    context.user = user
    context.token = JsonWebToken.encode(user_id: user.id)
  end

  private

  def validate
    @context.fail!(error: "Invalid password") unless user.valid_password?(password)
  end

  def user
    @user ||= User.find_by_email(context.email)
    @context.fail!(error: "User not found") if @user.nil?
    @user
  end

  def password
    context.password
  end
end