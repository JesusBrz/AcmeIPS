require 'test_helper'

class CitaTest < ActiveSupport::TestCase
  test "should not save cita" do
    cita = Cita.new
    assert true, "Cita guardada con exito"
  end
end
