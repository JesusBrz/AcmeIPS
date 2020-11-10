json.extract! schedule, :id, :documento_paciente, :documento_medico, :dia, :hora, :cita_id, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
