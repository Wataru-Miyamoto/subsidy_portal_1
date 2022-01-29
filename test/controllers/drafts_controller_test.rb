require 'test_helper'

class DraftsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get drafts_new_url
    assert_response :success
  end

  test "should get edit" do
    get drafts_edit_url
    assert_response :success
  end

end
