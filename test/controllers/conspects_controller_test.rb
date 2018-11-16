require 'test_helper'

class ConspectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conspect = conspects(:one)
  end

  test "should get index" do
    get conspects_url
    assert_response :success
  end

  test "should get new" do
    get new_conspect_url
    assert_response :success
  end

  test "should create conspect" do
    assert_difference('Conspect.count') do
      post conspects_url, params: { conspect: { content: @conspect.content, description: @conspect.description, speciality_number: @conspect.speciality_number, title: @conspect.title, user_id: @conspect.user_id } }
    end

    assert_redirected_to conspect_url(Conspect.last)
  end

  test "should show conspect" do
    get conspect_url(@conspect)
    assert_response :success
  end

  test "should get edit" do
    get edit_conspect_url(@conspect)
    assert_response :success
  end

  test "should update conspect" do
    patch conspect_url(@conspect), params: { conspect: { content: @conspect.content, description: @conspect.description, speciality_number: @conspect.speciality_number, title: @conspect.title, user_id: @conspect.user_id } }
    assert_redirected_to conspect_url(@conspect)
  end

  test "should destroy conspect" do
    assert_difference('Conspect.count', -1) do
      delete conspect_url(@conspect)
    end

    assert_redirected_to conspects_url
  end
end
