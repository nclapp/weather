WX_LINK = "http://api.wunderground.com/api/3db58be030a07a82/geolookup/conditions/q/IL/Chicago.json"
ASTRO_LINK = "http://api.wunderground.com/api/3db58be030a07a82/astronomy/q/IL/Chicago.json"
RADAR_LINK = "http://api.wunderground.com/api/3db58be030a07a82/animatedradar/q/IL/Chicago.gif?width=280&height=280&newmaps=1"
BEACH_LINK = "https://data.cityofchicago.org/api/views/v7bk-5pm9/rows.json"


get "/" do

  @radar = RADAR_LINK

  open(WX_LINK) do |f|  # This is OpenURI
    wx_json = JSON.parse(f.read)
    @location = wx_json['location']['city']
    @temp_f = wx_json['current_observation']['temp_f']
    @temp_c = wx_json['current_observation']['temp_c']
    @updated_at = wx_json['current_observation']['observation_time_rfc822']
    @conditions = wx_json['current_observation']['weather']
    @wind_dir = (wx_json['current_observation']['wind_dir'])
    @wind_mph = wx_json['current_observation']['wind_mph']
    @wind_gust = (wx_json['current_observation']['wind_gust_mph']).to_i
  end

  open(ASTRO_LINK) do |f|
    astro_json = JSON.parse(f.read)
    @sunrise_hour = astro_json['moon_phase']['sunrise']['hour']
    @sunrise_minute = astro_json['moon_phase']['sunrise']['minute']
    @sunset_hour = astro_json['moon_phase']['sunset']['hour']
    @sunset_minute = astro_json['moon_phase']['sunset']['minute']
    @moonphase = (astro_json['moon_phase']['phaseofMoon']).downcase
  end

  erb :index
end
