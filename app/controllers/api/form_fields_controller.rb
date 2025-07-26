class Api::FormFieldsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form
  before_action :set_form_field, only: [:show, :update, :destroy]

  def index
    render json: @form.form_fields
  end

  def show
    render json: @form_field
  end

  def create
    result = FormFields::Create.call(form: @form, params: form_field_params)

    if result.success?
      render json: result.form_field, status: :created
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  def update
    result = FormFields::Update.call(form_field: @form_field, params: form_field_params)

    if result.success?
      render json: result.form_field
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @form_field.destroy
    head :no_content
  end

  private

  def set_form
    @form = Form.find(params[:form_id])
  end

  def set_form_field
    @form_field = @form.form_fields.find(params[:id])
  end

  def form_field_params
    params.require(:form_field).permit(:type, :label, :required, :position, field_options: {}, config: {})
  end
end
