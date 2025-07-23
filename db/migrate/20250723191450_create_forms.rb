class CreateForms < ActiveRecord::Migration[8.0]
  def change
    create_table :forms do |t|
      t.references :user, null: false, foreign_key: true

      t.string :title, null: false
      t.text :description
      t.boolean :published, default: false
      t.string :slug
      t.jsonb :config, default: {}

      t.timestamps
    end

    add_index :forms, :slug, unique: true
  end
end
