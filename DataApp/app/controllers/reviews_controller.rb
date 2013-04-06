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
    num = params[:food].to_i
    unless num
      num = Business.count
    end
    retval = []
    Business.all.take(num).each do |b|
      h = {business: b, reviews: b.reviews}
      retval << h
    end
    render :json => retval
  end
end