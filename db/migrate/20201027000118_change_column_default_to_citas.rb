class ChangeColumnDefaultToCitas < ActiveRecord::Migration[6.0]
  def change
    change_column :citas, :tipo, :string, :default => "Web"
  end
end
