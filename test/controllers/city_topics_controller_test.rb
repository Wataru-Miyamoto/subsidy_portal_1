require 'test_helper'

class CityTopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get city_topics_new_url
    assert_response :success
  end

  test "should get edit" do
    get city_topics_edit_url
    assert_response :success
  end

  test "should get show" do
    get city_topics_show_url
    assert_response :success
  end

  test "should get index" do
    get city_topics_index_url
    assert_response :success
  end

end
