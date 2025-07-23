class CreateFormFields < ActiveRecord::Migration[8.0]
  def change
    create_table :form_fields do |t|
      t.references :form, null: false, foreign_key: true

      t.string :label, null: false
      t.string :field_type, null: false
      t.jsonb :field_options
      t.boolean :required, default: false
      t.integer :position
      t.jsonb :config, default: {}

      t.timestamps
    end
  end
end
