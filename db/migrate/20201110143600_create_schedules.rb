class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :documento_paciente, null: false
      t.string :documento_medico,   null: false
      t.date :dia,                  null: false
      t.time :hora,                 null: false
      t.references :cita,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
