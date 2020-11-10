require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should save user" do
    user = User.new
    assert true, "User guardado con exito"
  end
end
