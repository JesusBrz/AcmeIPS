class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.timestamp :fecha
      t.string :documento_paciente
      t.references :cita, null: false, foreign_key: true

      t.timestamps
    end
  end
end
