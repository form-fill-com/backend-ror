class Api::UsersController < ApplicationController
  def login
    user = User.find_by_email(params[:email])

    if user&.valid_password?(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      response.set_header('Authorization', "Bearer #{token}")

      render json: user
    else
      render json: { message: 'user not found' }, status: 404
    end
  end

  def register
    user = User.create(user_params)

    if user.persisted?
      render json: user
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
