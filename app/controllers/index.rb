API_LINK = "http://api.wunderground.com/api/3db58be030a07a82/geolookup/conditions/q/IL/Chicago.json"

get "/" do
  open(API_LINK) do |f|
    # can do /conditions/alers/forecast/hourly and a lot more
    json_string = f.read
    parsed_json = JSON.parse(json_string)
    @location = parsed_json['location']['city']
    @temp_f = parsed_json['current_observation']['temp_f']
  end
  erb :index
end
