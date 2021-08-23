require 'test_helper'

class PrefsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prefs_index_url
    assert_response :success
  end

  test "should get show" do
    get prefs_show_url
    assert_response :success
  end

end
