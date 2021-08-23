require 'test_helper'

class GovTopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gov_topics_new_url
    assert_response :success
  end

  test "should get edit" do
    get gov_topics_edit_url
    assert_response :success
  end

  test "should get show" do
    get gov_topics_show_url
    assert_response :success
  end

  test "should get index" do
    get gov_topics_index_url
    assert_response :success
  end

end
