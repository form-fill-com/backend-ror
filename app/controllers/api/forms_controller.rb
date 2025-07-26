class Api::FormsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form, only: [:show, :update, :destroy, :publish, :share]

  def index
    @forms = current_user.forms
    render json: @forms
  end

  def show
    render json: @form
  end

  def create
    result = Forms::Create.call(user: current_user, params: form_params)

    if result.success?
      render json: result.form, status: :created
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  def update
    result = Forms::Update.call(form: @form, params: form_params)

    if result.success?
      render json: result.form
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @form.destroy
    head :no_content
  end

  def publish
    @form.update(published: !@form.published)
    render json: { published: @form.published }
  end

  def share
    render json: {}
  end

  private

  def set_form
    @form = current_user.forms.find_by!(id: params[:id])
  end

  def form_params
    params.require(:form).permit(:title, :config, :status)
  end
end
