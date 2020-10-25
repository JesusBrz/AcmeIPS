class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :document, :string
    add_column :users, :birthday, :date
    add_column :users, :phone, :string
    add_column :users, :rol, :string, default: "usuario"
  end
end
