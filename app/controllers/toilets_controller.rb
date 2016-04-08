class ToiletsController < ApplicationController
  def index
    @toilets = Toilet.all
    # @jsToilets = Toilet.all.to_json.html_safe

    if params[:user_input]
    #get user input from previous page.
      @user_input = params[:user_input]

      #send request to google api to get latitude and longitude of user request
      address = toilet.location.gsub(" ", "+") + ",+New+York+City,+NY"
      url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + address + "&key=AIzaSyALN7GVrxfs8xQmQ1Rn1AXZe-uOGd3muVU"
      response = HTTParty.get(url)
        begin
          if response["status"] == "OK"
            @user_input_latitude = response["results"][0]["geometry"]["location"]["lat"]
            @user_input_longitude = response["results"][0]["geometry"]["location"]["lng"]
          end
        rescue
          #add error here if we had to run the rescue loop. Google could not find a match
        end
    else
      #user reached this page without going through homepage search box
      @user_input = false
    end
  end


  def show
  	@toilet = Toilet.find_by(id: params[:id])

  	@average_review = Toilet.average_review(@toilet)
  end

  def toilet_data
    render json: Toilet.all
  end

end
