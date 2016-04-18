require 'test_helper'

class ReflectionsControllerTest < ActionController::TestCase
  setup do
    @reflection = reflections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reflections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reflection" do
    assert_difference('Reflection.count') do
      post :create, reflection: { body: @reflection.body, feels: @reflection.feels, ip_address: @reflection.ip_address, latitude: @reflection.latitude, longitude: @reflection.longitude, type: @reflection.type, user_id: @reflection.user_id }
    end

    assert_redirected_to reflection_path(assigns(:reflection))
  end

  test "should show reflection" do
    get :show, id: @reflection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reflection
    assert_response :success
  end

  test "should update reflection" do
    patch :update, id: @reflection, reflection: { body: @reflection.body, feels: @reflection.feels, ip_address: @reflection.ip_address, latitude: @reflection.latitude, longitude: @reflection.longitude, type: @reflection.type, user_id: @reflection.user_id }
    assert_redirected_to reflection_path(assigns(:reflection))
  end

  test "should destroy reflection" do
    assert_difference('Reflection.count', -1) do
      delete :destroy, id: @reflection
    end

    assert_redirected_to reflections_path
  end
end
