class Cita < ApplicationRecord
    has_many :schedules, dependent: :destroy
end
