class BusinessesController < ApplicationController
  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.order(:name).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @businesses }
    end
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    @business = Business.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business }
    end
  end

  def list_restaurants
    zipc = params[:zip]
    unless zipc && zipc.length == 5
      zipc = "19104"
    end
    list = []
    coords = Business.find_lat_long(zipc)
    category = Category.where(:name => "Restaurants").first
    Business.near_location(coords['lat'], coords['long'], 0.05).each do |b|
      if list.length < 15
        if b.categories.include?(category)
          hash = {}
          hash["name"] = b.name
          hash["rating"] = b.stars
          hash["address"] = b.full_address
          hash["latlng"] = [b.latitude, b.longitude]
          list << hash
        end
      else
        break
      end
    end
    list.sort!{|x,y| y["rating"] <=> x["rating"]}
    render json: {results: list}
  end

end
