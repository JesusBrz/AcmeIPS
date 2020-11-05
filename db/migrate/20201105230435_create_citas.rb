class CreateCitas < ActiveRecord::Migration[6.0]
  def change
    create_table :citas do |t|
      t.string :nombre_paciente
      t.string :documento_paciente
      t.string :telefono_paciente
      t.string :nombre_medico
      t.timestamp :fecha
      t.string :tipo

      t.timestamps
    end
  end
end
