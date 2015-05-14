require 'open-uri'
require 'json'
open('http://api.wunderground.com/api/3db58be030a07a82/geolookup/conditions/q/IL/Chicago.json') do |f|
  # can do /conditions/alers/forecast/hourly and a lot more
  json_string = f.read
  parsed_json = JSON.parse(json_string)
  location = parsed_json['location']['city']
  temp_f = parsed_json['current_observation']['temp_f']
  print "Current temperature in #{location} is: #{temp_f}\n"
end

