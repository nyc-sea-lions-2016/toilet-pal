class ToiletsController < ApplicationController
  def index
    if params.has_key?(:user_input)
      geo_info = Geocoder.search(params[:user_input])
        user_search_lat = geo_info[0].data["geometry"]["location"]["lat"]
        user_search_lon = geo_info[0].data["geometry"]["location"]["lng"]
        @search_location = [user_search_lat,user_search_lon]
        #need to throw error if geo_info could not parse answer correctly.
    else
      @search_location = [40.7831, -73.9712] #center manhattan
    end

    # toilets within one mile (in meters) of central manhattan or user search input:
    @all_toilets = Toilet.all.select do |toilet|
      toilet.distance_to(@search_location[0], @search_location[1]) < 1609
    end
    @toilets = @all_toilets.sort{|x,y| x.distance_to(@search_location[0], @search_location[1]) <=> y.distance_to(@search_location[0], @search_location[1])}
  end


  def show
  	@toilet = Toilet.find_by(id: params[:id])

  	@average_review = Toilet.average_review(@toilet)
  end

  def toilet_data
    render json: Toilet.all
  end

  def user_search
    redirect_to action: 'index', controller: 'toilets', user_input: params[:user][:user_input]
  end

end
