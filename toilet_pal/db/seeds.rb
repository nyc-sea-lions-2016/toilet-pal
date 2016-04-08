# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


response = HTTParty.get('https://data.cityofnewyork.us/resource/h87e-shkn.json')
response.each do |item|
	Toilet.create(
		name: item['name'],
		location: item['location'],
		description: item['type']
	)
end

puts Toilet.count

Toilet.all.each do |toilet|
    address = toilet.location.gsub(" ", "+") + ",+New+York+City,+NY"
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + address + "&key=AIzaSyALN7GVrxfs8xQmQ1Rn1AXZe-uOGd3muVU"
  response = HTTParty.get(url)
  begin
    if response["status"] == "OK"
      toilet.zip_code = nil
      toilet.neighborhood = response["results"][0]["address_components"][1]["long_name"]
      toilet.sublocality = response["results"][0]["address_components"][2]["long_name"]
      toilet.latitude = response["results"][0]["geometry"]["location"]["lat"]
      toilet.longitude = response["results"][0]["geometry"]["location"]["lng"]
      toilet.save
    end
  rescue
      puts toilet
      puts response
  end
  puts toilet.id
end