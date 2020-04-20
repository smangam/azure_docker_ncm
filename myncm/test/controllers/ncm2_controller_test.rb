require 'test_helper'

class Ncm2ControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get ncm2_list_url
    assert_response :success
  end

  test "should get show" do
    get ncm2_show_url
    assert_response :success
  end

end
