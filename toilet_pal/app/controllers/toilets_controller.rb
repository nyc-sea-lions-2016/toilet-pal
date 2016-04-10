class ToiletsController < ApplicationController
  def index
    binding.pry
    @center_manhattan = [40.7831, -73.9712]

    # toilets within ten miles (in meters) of central manhattan:
    @all_toilets = Toilet.all.select do |toilet|
      toilet.distance_to(@center_manhattan[0], @center_manhattan[1]) < 16093
    end
    @toilets = @all_toilets.sort{|x,y| x.distance_to(@center_manhattan[0], @center_manhattan[1]) <=> y.distance_to(@center_manhattan[0], @center_manhattan[1])}
  end


  def show
  	@toilet = Toilet.find_by(id: params[:id])

  	@average_review = Toilet.average_review(@toilet)
  end

  def toilet_data
    render json: Toilet.all
  end

end
