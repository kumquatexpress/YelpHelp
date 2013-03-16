require 'test_helper'

class YelpUsersControllerTest < ActionController::TestCase
  setup do
    @yelp_user = yelp_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yelp_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yelp_user" do
    assert_difference('YelpUser.count') do
      post :create, yelp_user: { average_stars: @yelp_user.average_stars, name: @yelp_user.name, review_count: @yelp_user.review_count, url: @yelp_user.url, user_id: @yelp_user.user_id, vote.useful: @yelp_user.vote.useful }
    end

    assert_redirected_to yelp_user_path(assigns(:yelp_user))
  end

  test "should show yelp_user" do
    get :show, id: @yelp_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yelp_user
    assert_response :success
  end

  test "should update yelp_user" do
    put :update, id: @yelp_user, yelp_user: { average_stars: @yelp_user.average_stars, name: @yelp_user.name, review_count: @yelp_user.review_count, url: @yelp_user.url, user_id: @yelp_user.user_id, vote.useful: @yelp_user.vote.useful }
    assert_redirected_to yelp_user_path(assigns(:yelp_user))
  end

  test "should destroy yelp_user" do
    assert_difference('YelpUser.count', -1) do
      delete :destroy, id: @yelp_user
    end

    assert_redirected_to yelp_users_path
  end
end
