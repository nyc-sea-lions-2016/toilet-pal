# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


response = HTTParty.get('https://data.cityofnewyork.us/resource/h87e-shkn.json')
# binding.pry
response.each do |item| 
	Toilet.create(
		name: item['name'],
		location: item['location'],
		description: item['type']
	)
end

