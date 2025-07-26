class FormFields::Update
  include Interactor

  def call
    form_field = context.form_field

    if form_field.update(context.params)
      context.form_field = form_field
    else
      context.fail!(errors: form_field.errors.full_messages)
    end
  end
end