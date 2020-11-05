json.extract! cita, :id, :nombre_paciente, :documento_paciente, :telefono_paciente, :nombre_medico, :fecha, :tipo, :created_at, :updated_at
json.url cita_url(cita, format: :json)
