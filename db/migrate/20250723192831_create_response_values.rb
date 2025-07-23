class CreateResponseValues < ActiveRecord::Migration[8.0]
  def change
    create_table :response_values do |t|
      t.references :form_response, null: false, foreign_key: true
      t.references :form_field, null: false, foreign_key: true

      t.text :value

      t.timestamps
    end
  end
end
