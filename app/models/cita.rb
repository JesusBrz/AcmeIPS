class Cita < ApplicationRecord
    has_many :schedules, dependent: :destroy
    validates_uniqueness_of :hora, scope: [:dia, :nombre_medico], message: "-> El Médico está ocupado a esa hora"
end
