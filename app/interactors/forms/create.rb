class Forms::Create
  include Interactor

  def call
    form = context.user.forms.new(context.params)

    if form.save
      context.form = form
    else
      context.fail!(errors: form.errors)
    end
  end
end