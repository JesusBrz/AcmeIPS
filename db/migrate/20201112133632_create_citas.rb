class CreateCitas < ActiveRecord::Migration[6.0]
  def change
    create_table :citas do |t|
      t.string :nombre_paciente,    null: false
      t.string :documento_paciente, null: false
      t.string :correo_paciente,    null: false
      t.string :telefono_paciente,  null: false
      t.string :nombre_medico,      null: false
      t.date :dia,                  null: false
      t.time :hora,                 null: false
      t.string :tipo,               null: false, default: "web"

      t.timestamps
    end
  end
end
