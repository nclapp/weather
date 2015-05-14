API_LINK = "http://api.wunderground.com/api/3db58be030a07a82/geolookup/conditions/q/IL/Chicago.json"
RADAR_LINK = "http://api.wunderground.com/api/3db58be030a07a82/animatedradar/q/IL/Chicago.gif?width=280&height=280&newmaps=1"

get "/" do
  open(API_LINK) do |f|
    # can do /conditions/alers/forecast/hourly and a lot more
    json_string = f.read
    parsed_json = JSON.parse(json_string)
    @location = parsed_json['location']['city']
    @temp_f = parsed_json['current_observation']['temp_f']
    @temp_c = parsed_json['current_observation']['temp_c']
    @updated_at = parsed_json['current_observation']['observation_time_rfc822']
    @conditions = parsed_json['current_observation']['weather']
    @wind_dir = parsed_json['current_observation']['wind_dir']
    @wind_mph = parsed_json['current_observation']['wind_mph']
    @wind_gust = (parsed_json['current_observation']['wind_gust_mph']).to_i
    @radar = RADAR_LINK
  end
  erb :index
end
