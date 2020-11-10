json.extract! cita, :id, :nombre_paciente, :documento_paciente, :correo_paciente, :telefono_paciente, :nombre_medico, :documento_medico, :dia, :hora, :tipo, :created_at, :updated_at
json.url cita_url(cita, format: :json)
