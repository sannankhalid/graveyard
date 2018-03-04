require 'test_helper'

class GravesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grave = graves(:one)
  end

  test "should get index" do
    get graves_url
    assert_response :success
  end

  test "should get new" do
    get new_grave_url
    assert_response :success
  end

  test "should create grave" do
    assert_difference('Grave.count') do
      post graves_url, params: { grave: { age: @grave.age, created_by_id: @grave.created_by_id, died_at: @grave.died_at, gender: @grave.gender, name: @grave.name, number: @grave.number, relationship_id: @grave.relationship_id, relationship_name: @grave.relationship_name, updated_by_id: @grave.updated_by_id } }
    end

    assert_redirected_to grave_url(Grave.last)
  end

  test "should show grave" do
    get grave_url(@grave)
    assert_response :success
  end

  test "should get edit" do
    get edit_grave_url(@grave)
    assert_response :success
  end

  test "should update grave" do
    patch grave_url(@grave), params: { grave: { age: @grave.age, created_by_id: @grave.created_by_id, died_at: @grave.died_at, gender: @grave.gender, name: @grave.name, number: @grave.number, relationship_id: @grave.relationship_id, relationship_name: @grave.relationship_name, updated_by_id: @grave.updated_by_id } }
    assert_redirected_to grave_url(@grave)
  end

  test "should destroy grave" do
    assert_difference('Grave.count', -1) do
      delete grave_url(@grave)
    end

    assert_redirected_to graves_url
  end
end
