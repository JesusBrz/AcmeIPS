class CitasController < ApplicationController
    def index 
        @cita = Cita.all
    end

    def show
        @cita = Cita.find(params[:id])
    end
    
    def new
    end
    
    def create
        @cita = Cita.new(cita_params)
   
        @cita.save
        redirect_to citas_url
    end
   
    private
        def cita_params
            params.require(:citas).permit(:nombre_paciente, :documento_paciente, :telefono_paciente, :nombre_medico, :fecha, :hora, :tipo)
        end
end
