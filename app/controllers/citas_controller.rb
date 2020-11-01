class CitasController < ApplicationController
    def index 
        @cita = Cita.all
    end

    def show
        @cita = Cita.find(params[:id])
    end

    def new
        @article = Cita.new
    end

    def edit
        @article = Cita.find(params[:id])
    end

    def create
        @cita = Cita.new(cita_params)
        if @cita.save
            if user_signed_in?
                redirect_to citas_path
            else
                redirect_to new_user_registration_path
            end
        else
            render 'new'
        end
    end

    def update
        @cita = Cita.find(params[:id])
        if @cita.update(cita_params)
            redirect_to @cita
        else
            render 'edit'
        end
    end

    def destroy
        @cita = Cita.find(params[:id])
        @cita.destroy
        redirect_to citas_path
    end

    private
    def cita_params
        params.require(:citas).permit(:nombre_paciente, :documento_paciente, :telefono_paciente, :nombre_medico, :fecha, :hora, :tipo)
    end
end
