require 'test_helper'

class CastesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caste = castes(:one)
  end

  test "should get index" do
    get castes_url
    assert_response :success
  end

  test "should get new" do
    get new_caste_url
    assert_response :success
  end

  test "should create caste" do
    assert_difference('Caste.count') do
      post castes_url, params: { caste: { is_active: @caste.is_active, name: @caste.name } }
    end

    assert_redirected_to caste_url(Caste.last)
  end

  test "should show caste" do
    get caste_url(@caste)
    assert_response :success
  end

  test "should get edit" do
    get edit_caste_url(@caste)
    assert_response :success
  end

  test "should update caste" do
    patch caste_url(@caste), params: { caste: { is_active: @caste.is_active, name: @caste.name } }
    assert_redirected_to caste_url(@caste)
  end

  test "should destroy caste" do
    assert_difference('Caste.count', -1) do
      delete caste_url(@caste)
    end

    assert_redirected_to castes_url
  end
end
