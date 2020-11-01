class CreateCitas < ActiveRecord::Migration[6.0]
  def change
    create_table :citas do |t|
      ## Datos Paciente
      t.string :nombre_paciente,    null: false, default: ""
      t.string :documento_paciente, null: false, default: ""
      t.string :telefono_paciente,  default: ""

      ##Datos Personal Médico
      t.string :nombre_medico,      null: false

      ## Datos Cita Médica
      t.date :fecha,                null: false
      t.time :hora,                 null: false

      ## Extra Personal Administrativo
      t.string :tipo,               null: false, default: "Web"

      t.timestamps
    end
  end
end
