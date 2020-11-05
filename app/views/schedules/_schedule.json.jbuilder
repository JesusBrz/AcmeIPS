json.extract! schedule, :id, :day, :hour, :documento_paciente, :cita_id, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
