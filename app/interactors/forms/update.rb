class Forms::Update
  include Interactor

  def call
    form = context.form

    if form.update(context.params)
      context.form = form
    else
      context.fail!(errors: form.errors)
    end
  end
end