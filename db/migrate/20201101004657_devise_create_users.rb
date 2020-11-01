class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Extra
      t.string :name,     null: false, default: ""
      t.string :surname,  null: false, default: ""
      t.string :document, null: false, default: ""
      t.date   :birthday, null: false
      t.string :phone,    default: ""
      t.string :rol,      null: false, default: "usuario"

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end
    
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :document,             unique: true
    add_index :users, :phone,                unique: true
  end
end
