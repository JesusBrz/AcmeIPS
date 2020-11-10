require 'test_helper'

class CitasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cita = citas(:one)
  end

  test "should get index" do
    get citas_url
    assert_response :success
  end

  test "should get new" do
    get new_cita_url
    assert_response :success
  end

  test "should create cita" do
    assert_difference('Cita.count') do
      post citas_url, params: { cita: { correo_paciente: @cita.correo_paciente, dia: @cita.dia, documento_paciente: @cita.documento_paciente, hora: @cita.hora, nombre_medico: @cita.nombre_medico, nombre_paciente: @cita.nombre_paciente, telefono_paciente: @cita.telefono_paciente, tipo: @cita.tipo } }
    end

    assert_redirected_to cita_url(Cita.last)
  end

  test "should show cita" do
    cita = citas(:one)
    get cita_url(cita)
    assert_response :success
  end

  test "should get edit" do
    get edit_cita_url(@cita)
    assert_response :success
  end

  test "should update cita" do
    patch cita_url(@cita), params: { cita: { correo_paciente: @cita.correo_paciente, dia: @cita.dia, documento_paciente: @cita.documento_paciente, hora: @cita.hora, nombre_medico: @cita.nombre_medico, nombre_paciente: @cita.nombre_paciente, telefono_paciente: @cita.telefono_paciente, tipo: @cita.tipo } }
    assert_redirected_to cita_url(@cita)
  end

  test "should destroy cita" do
    assert_difference('Cita.count', -1) do
      delete cita_url(@cita)
    end

    assert_redirected_to citas_url
  end
end
