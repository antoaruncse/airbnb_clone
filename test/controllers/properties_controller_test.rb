require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post :create, property: { accomodates: @property.accomodates, address: @property.address, city: @property.city, home_type: @property.home_type, price_night: @property.price_night, room_type: @property.room_type, title: @property.title, user_id: @property.user_id }
    end

    assert_redirected_to property_path(assigns(:property))
  end

  test "should show property" do
    get :show, id: @property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property
    assert_response :success
  end

  test "should update property" do
    patch :update, id: @property, property: { accomodates: @property.accomodates, address: @property.address, city: @property.city, home_type: @property.home_type, price_night: @property.price_night, room_type: @property.room_type, title: @property.title, user_id: @property.user_id }
    assert_redirected_to property_path(assigns(:property))
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete :destroy, id: @property
    end

    assert_redirected_to properties_path
  end
end
