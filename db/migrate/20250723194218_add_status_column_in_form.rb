class AddStatusColumnInForm < ActiveRecord::Migration[8.0]
  def change
    add_column :forms, :status, :string, default: 'draft'
  end
end
