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

    # toilets sorted by distance
    @toilets_by_distance = @all_toilets.sort{|x,y| x.distance_to(@search_location[0], @search_location[1]) <=> y.distance_to(@search_location[0], @search_location[1])}

    # toilets paginated
    @toilets = @toilets_by_distance.paginate(:page => params[:page], :per_page => 20)
  end


  def show
  	@toilet = Toilet.find_by(id: params[:id])

  	@average_review = Toilet.average_review(@toilet)
  end

  def toilet_data
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    # case params[:filter]
    # when 'Public'
    #   render json: Toilet.where()
    # when 'coffee shop'
    #   render json: Toilet.where('tag = ?')
    # render json: Toilet.all
=======
    if params[:filter]
      case params[:filter]
=======
    render json: Toilet.all
  end

  def filter_data
      case params[:filter][:info]
>>>>>>> 4924051... begin work on new toilet
      when 'Public'
        @tag = Tag.find_by(tag: 'Public')
      when 'Basketball Courts'
        @tag = Tag.find_by(tag: 'Basketball Courts')
      when 'Book Store'
        @tag = Tag.find_by(tag: 'Book Store')
      end

      @joins = Tagtoilet.where('tag_id = ?', @tag.id)
      @toilets = @joins.map{|join| Toilet.find(join.toilet_id)}
<<<<<<< HEAD
      render json: @toilets
    else
      render json: Toilet.all
    end

>>>>>>> 91ed726... Added filters, working on functionality
=======

    # if params[:filter]
    #   case params[:filter]
    #   when 'Public'
    #     @tag = Tag.find_by(tag: 'Public')
    #   when 'Basketball Courts'
    #     @tag = Tag.find_by(tag: 'Basketball Courts')
    #   when 'Book Store'
    #     @tag = Tag.find_by(tag: 'Book Store')
    #   end

    #   @joins = Tagtoilet.where('tag_id = ?', @tag.id)
    #   @toilets = @joins.map{|join| Toilet.find(join.toilet_id)}
    #   render json: @toilets
    # else
    #   render json: Toilet.all
    # end
>>>>>>> a4959e2... adjust error handling
=======
      @toilets.to_json
>>>>>>> 4924051... begin work on new toilet
  end

  def user_search
    redirect_to action: 'index', controller: 'toilets', user_input: params[:user][:user_input]
  end




end
