class Cita < ApplicationRecord
    require 'csv'
    
    validates_uniqueness_of :hora, scope: [:dia, :nombre_medico], message: "-> El Médico está ocupado a esa hora"

    after_update :send_cita_reprogramada_mail

    def send_cita_reprogramada_mail
        UserMailer.cita_reprogramada(self).deliver_now
    end

    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
          csv << column_names
          all.each do |cita|
            csv << cita.attributes.values_at(*column_names)
          end
        end
      end

end
