require 'test_helper'

class ThumbsControllerTest < ActionController::TestCase
  setup do
    @thumb = thumbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thumbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thumb" do
    assert_difference('Thumb.count') do
      post :create, :thumb => @thumb.attributes
    end

    assert_redirected_to thumb_path(assigns(:thumb))
  end

  test "should show thumb" do
    get :show, :id => @thumb.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @thumb.to_param
    assert_response :success
  end

  test "should update thumb" do
    put :update, :id => @thumb.to_param, :thumb => @thumb.attributes
    assert_redirected_to thumb_path(assigns(:thumb))
  end

  test "should destroy thumb" do
    assert_difference('Thumb.count', -1) do
      delete :destroy, :id => @thumb.to_param
    end

    assert_redirected_to thumbs_path
  end
end
