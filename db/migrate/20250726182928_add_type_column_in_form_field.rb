class AddTypeColumnInFormField < ActiveRecord::Migration[8.0]
  def change
    add_column :form_fields, :type, :string, null: false
  end
end
