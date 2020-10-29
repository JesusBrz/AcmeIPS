class Cita < ApplicationRecord
    validates :nombre_paciente, presence: true, length: { minimum: 5 }
    validates :documento_paciente, presence: true, length: { minimum: 10 }
    validates :telefono_paciente, presence: true, length: { minimum: 10 }
    validates :nombre_medico, presence: true, length: { minimum: 5 }
end
