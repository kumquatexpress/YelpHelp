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
    puts "here"
    dish = params[:dish]
    lat = params[:lat]
    long = params[:long]
    if lat.count < 2 and long.count < 2
      lat = lat.first.to_f
      long = long.first.to_f
    else
      list_multiple_places(lat, long)
      return
    end
    list = []

    businesses = Business.near_location(lat, long, 0.05)
    if dish
      food = FoodItem.where(:name => dish.downcase).first()
      if food
        businesses = Business.where(:business_id => food.businesses_ids)
      end
    end
    businesses.take(15).each do |b|
      if list.length < 15
        puts "here"
        hash = {}
        hash["name"] = b.name
        hash["rating"] = b.stars
        hash["address"] = b.full_address
        hash["latlng"] = [b.latitude, b.longitude]
        list << hash
      else
        break
      end
    end
    list.sort!{|x,y| (x["lat"].to_f-lat+x["long"].to_f-long).abs <=> (y["lat"].to_f-lat+y["long"].to_f-long).abs}
    puts list
    render json: {results: list}
  end


  def list_multiple_places(lats, longs)
    list = []
    lats.zip(longs).each do |lat, long|
      lat = lat.to_f
      long = lat.to_f
      businesses = Business.near_location(lat, long, 0.02)
      businesses.take(5).each do |b|
        hash = {}
        hash["name"] = b.name
        hash["rating"] = b.stars
        hash["address"] = b.full_address
        hash["latlng"] = [b.latitude, b.longitude]
        list << hash
      end
    end
    list.sort!{|x,y| (x["lat"].to_f-lat+x["long"].to_f-long).abs <=> (y["lat"].to_f-lat+y["long"].to_f-long).abs}
    puts list
    render json: {results: list}
  end

  def list_by_meal
    lat = params[:lat].to_f
    long = params[:long].to_f
    dishes = params[:dishes]
    retval = {}
    dishes.each do |dish|
      food = FoodItem.where(:name => dish.downcase).first()
      if food
        b = Business.where(:business_id => food.businesses_ids)
        b.sort!{|x,y| (x.lat-lat+x.long-long).abs <=> (y.lat-lat+y.long-long).abs}
        retval[dish] = b.first
      end
    end
    retval
  end

end
