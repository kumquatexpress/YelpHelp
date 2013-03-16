require 'test_helper'

class BusinessesControllerTest < ActionController::TestCase
  setup do
    @business = businesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:businesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business" do
    assert_difference('Business.count') do
      post :create, business: { business_id: @business.business_id, categories: @business.categories, city: @business.city, full_address: @business.full_address, latitude: @business.latitude, longitude: @business.longitude, name: @business.name, neighborhoods: @business.neighborhoods, open: @business.open, photo_url: @business.photo_url, review_count: @business.review_count, schools: @business.schools, stars: @business.stars, state: @business.state, url: @business.url }
    end

    assert_redirected_to business_path(assigns(:business))
  end

  test "should show business" do
    get :show, id: @business
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business
    assert_response :success
  end

  test "should update business" do
    put :update, id: @business, business: { business_id: @business.business_id, categories: @business.categories, city: @business.city, full_address: @business.full_address, latitude: @business.latitude, longitude: @business.longitude, name: @business.name, neighborhoods: @business.neighborhoods, open: @business.open, photo_url: @business.photo_url, review_count: @business.review_count, schools: @business.schools, stars: @business.stars, state: @business.state, url: @business.url }
    assert_redirected_to business_path(assigns(:business))
  end

  test "should destroy business" do
    assert_difference('Business.count', -1) do
      delete :destroy, id: @business
    end

    assert_redirected_to businesses_path
  end
end
