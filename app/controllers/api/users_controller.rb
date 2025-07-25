class Api::UsersController < ApplicationController
  def login
    result = Users::Login.call(**login_params)

    if result.success?
      response.set_header('Authorization', "Bearer #{result.token}")
      render json: result.user
    else
      render json: { error: result.error }, status: :unauthorized
    end
  end

  def register
    result = Users::Registeration.call(params: user_params)

    if result.success?
      response.set_header('Authorization', "Bearer #{result.token}")
      render json: result.user
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
