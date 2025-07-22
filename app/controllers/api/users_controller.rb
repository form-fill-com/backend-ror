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
end
