class YelpUsersController < ApplicationController
  # GET /yelp_users
  # GET /yelp_users.json
  def index
    @yelp_users = YelpUser.order(:name).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yelp_users }
    end
  end

  # GET /yelp_users/1
  # GET /yelp_users/1.json
  def show
    @yelp_user = YelpUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yelp_user }
    end
  end
end
 