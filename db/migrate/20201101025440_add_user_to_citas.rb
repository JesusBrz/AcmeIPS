class AddUserToCitas < ActiveRecord::Migration[6.0]
  def change
    add_reference :citas, :user, null: false, foreign_key: true
  end
end
