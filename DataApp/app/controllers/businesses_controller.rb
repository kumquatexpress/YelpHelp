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
    category = Category.where(:name => "Restaurants").first
    businesses = Business.near_location(lat, long, 0.05)
    if dish
      food = FoodItem.where(:name => dish.downcase).first()
      if food
        businesses = Business.where(:business_id => food.businesses_ids)
      end
    end
    businesses.keep_if{|x| x.categories.include?(category)}.take(15).each do |b|
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
    big_list = []
    category = Category.where(:name => "Restaurants").first
    lats.zip(longs).each do |coords|
      list = []
      lat = coords[0].to_f
      long = coords[1].to_f
      puts [lat, long].inspect
      businesses = Business.near_location(lat, long, 0.02)
      businesses.uniq.keep_if{|x| x.categories.include?(category)}.take(15).each do |b|
        puts "here"
        hash = {}
        hash["name"] = b.name
        hash["rating"] = b.stars
        hash["address"] = b.full_address
        hash["latlng"] = [b.latitude, b.longitude]
        list << hash
        puts list.inspect
      end
      list.sort!{|x,y| (x["lat"].to_f-lat+x["long"].to_f-long).abs <=> (y["lat"].to_f-lat+y["long"].to_f-long).abs}
      big_list << list
    end
    puts big_list.flatten
    render json: {results: big_list.flatten}
  end

  def list_by_meal
    lat = params[:lat].to_f
    long = params[:long].to_f
    dishes = params[:dishes]
    category = Category.where(:name => "Restaurants").first
    retval = []
    used = []
    dishes.each do |dish|
      food = FoodItem.where(:name => dish.downcase).first()
      puts food
      if food
        b = Business.where(:business_id => food.businesses_ids).keep_if{|x| x.categories.include?(category)}
        puts b.inspect
        b.sort!{|x,y| (x.latitude-lat+x.longitude-long).abs <=> (y.latitude-lat+y.longitude-long).abs}
        while used.include?(b.first) do
          b.shift
        end
        used << b.first
        if b.first
          hash = {}
          hash["name"] = b.first.name
          hash["rating"] = b.first.stars
          hash["address"] = b.first.full_address
          hash["latlng"] = [b.first.latitude, b.first.longitude]
          retval << hash
        end
      end
    end
    render json: {results: retval}
  end

end
