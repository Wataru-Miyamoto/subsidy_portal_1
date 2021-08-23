require 'test_helper'

class PrefTopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pref_topics_new_url
    assert_response :success
  end

  test "should get edit" do
    get pref_topics_edit_url
    assert_response :success
  end

  test "should get show" do
    get pref_topics_show_url
    assert_response :success
  end

  test "should get index" do
    get pref_topics_index_url
    assert_response :success
  end

end
