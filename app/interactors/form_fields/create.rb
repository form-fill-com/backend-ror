class FormFields::Create
  include Interactor

  def call
    form = context.form
    form_field = form.form_fields.new(context.params)

    if form_field.save
      context.form_field = form_field
    else
      context.fail!(errors: form_field.errors.full_messages)
    end
  end
end