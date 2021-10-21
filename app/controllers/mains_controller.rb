class MainsController < ApplicationController

  def index
    begin
    client = OpenWeather::Client.new(
      api_key: "049bc05390407e3878c4fced5324bf59"
    )
    @minTemp = 0
    @maxTemp = 1
    @a = params[:city]
    data = client.current_weather(city:"" + @a, units: 'metric', lang: 'ru')
    @t = Time.now.hour
    @name = "#{data.name}"
    @temp = "#{data.main.temp}°\n"
    @minTemp = data.main.temp_min_c
    @maxTemp = data.main.temp_max
    @text = "Максимальная #{@maxTemp} Минимальная #{@minTemp}\n Ветер: #{data.wind.speed}м/c"
    rescue
      @e = "Ошибка!"
    end
  end

end
