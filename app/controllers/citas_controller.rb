class CitasController < ApplicationController
  before_action :set_cita, only: [:show, :edit, :update, :destroy]

  # GET /citas
  # GET /citas.json
  def index
    @citas = Cita.all
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
        @schedule = Schedule.create(documento_paciente: @cita.documento_paciente,  documento_medico: @cita.documento_medico, dia: @cita.dia, hora: @cita.hora, cita_id: @cita.id)
        format.html { redirect_to @cita, notice: 'La cita fue creada con éxito.' }
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
        @schedule = Schedule.update(dia: @cita.dia, hora: @cita.hora)
        format.html { redirect_to @cita, notice: 'La cita fue reprogramada con éxito.' }
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
    @schedules = Schedule.where(cita_id: @cita.id)
    @schedules.each do |schedule|
      schedule.destroy
    end
    @cita.destroy
    respond_to do |format|
      format.html { redirect_to citas_url, notice: 'La Cita fue cancelada con éxito.' }
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
      params.require(:cita).permit(:nombre_paciente, :documento_paciente, :correo_paciente, :telefono_paciente, :nombre_medico, :documento_medico, :dia, :hora, :tipo)
    end
end
