class ReviewsController < ApplicationController
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  def search_food
    reviews = Review.find_food_item(params[:food], params[:operation])
    begin
      render :json => reviews
    rescue
      render :json => []
    end
  end

  def all_by_business
    min = params[:food].to_i
    max = params[:operation].to_i
    unless min
      min = 0
    end
    unless max
      max = min+100
    end
    retval = []
    Business.all[min..max].each do |b|
      h = {business: b, reviews: b.reviews}
      retval << h
    end
    render :json => retval
  end

  def close_to_philly
    min = params[:food].to_i
    max = params[:operation].to_i
    unless min
      min = 0
    end
    unless max
      max = min+100
    end
    zipc = "19104"
    retval = []
    coords = Business.find_lat_long(zipc)
    Business.near_location(coords['lat'], coords['long'], 2)[min..max] do |b|
      h = {business: b, reviews: b.reviews}
      retval << h
    end
    render :json => retval
  end


end