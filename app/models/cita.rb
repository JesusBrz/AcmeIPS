class Cita < ApplicationRecord
    has_many :schedules, dependent: :destroy
    validates_uniqueness_of :fecha, message: "Horario Ocupado"
end
