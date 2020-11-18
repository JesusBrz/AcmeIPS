class CitasController < ApplicationController
  before_action :set_cita, only: [:show, :edit, :update, :destroy]

  # GET /citas
  # GET /citas.json
  def index
    @citas = Cita.all
    respond_to do |format|
      format.html
      format.csv { send_data @citas.to_csv }
      format.xls # { send_data @citas.to_csv(col_sep: "\t") }
    end
  end

  # GET /citas/1
  # GET /citas/1.json
  def show
  end

  # GET /citas/new
  def new
    @cita = Cita.new
  end

  # GET /citas/1/edit
  def edit
  end

  # POST /citas
  # POST /citas.json
  def create
    @cita = Cita.new(cita_params)

    respond_to do |format|
      if @cita.save
        if user_signed_in?
          UserMailer.cita_nueva(@cita).deliver_now
        else 
          UserMailer.new_user_cita_nueva(@cita).deliver_now
          @user = User.new(
            :email => @cita.correo_paciente, 
            :password => auto_password, 
            :password_confirmation => auto_password, 
            :name => give_name, 
            :surname => give_surname, 
            :document => @cita.documento_paciente, 
            :birthday => Date.today, 
            :phone => @cita.telefono_paciente
          )
          @user.save
        end
        format.html { redirect_to @cita, notice: 'Cita was successfully created.' }
        format.json { render :show, status: :created, location: @cita }
      else
        format.html { render :new }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citas/1
  # PATCH/PUT /citas/1.json
  def update
    respond_to do |format|
      if @cita.update(cita_params)
        format.html { redirect_to @cita, notice: 'Cita was successfully updated.' }
        format.json { render :show, status: :ok, location: @cita }
      else
        format.html { render :edit }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citas/1
  # DELETE /citas/1.json
  def destroy
    @cita.destroy
    respond_to do |format|
      format.html { redirect_to citas_url, notice: 'Cita was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cita
      @cita = Cita.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cita_params
      params.require(:cita).permit(:nombre_paciente, :documento_paciente, :correo_paciente, :telefono_paciente, :nombre_medico, :dia, :hora, :tipo)
    end

    def auto_password
      return @cita.documento_paciente
    end

    def give_name
      if @cita.nombre_paciente.count(' ') == 1 || @cita.nombre_paciente.count(' ') == 2
        return @cita.nombre_paciente.split[0]
      else
        return @cita.nombre_paciente.split[0..-3].join(' ')
      end
    end

    def give_surname
      if @cita.nombre_paciente.count(' ') == 1
        return @cita.nombre_paciente.split[1]
      else
        return @cita.nombre_paciente.split[-2..-1].join(' ')
      end
    end
end
