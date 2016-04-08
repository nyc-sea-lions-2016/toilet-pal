class ToiletsController < ApplicationController
  def index

  end

  def show
  	@toilet = Toilet.find_by(id: params[:id])
  
  	@average_review = Toilet.average_review(@toilet)
  end

end
