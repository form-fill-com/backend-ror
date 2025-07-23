class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  protected

  def authenticate_user!
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    decoded = JsonWebToken.decode(header)

    @current_user = User.find_by(id: decoded[:user_id]) if decoded

    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
  end

  def current_user
    @current_user
  end
end
