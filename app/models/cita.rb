class Cita < ApplicationRecord
    validates_uniqueness_of :hora, scope: [:dia, :nombre_medico], message: "-> El Médico está ocupado a esa hora"

    after_update :send_cita_reprogramada_mail

    def send_cita_reprogramada_mail
        UserMailer.cita_reprogramada(self).deliver_now
    end

end
