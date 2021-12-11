require 'httparty'
require 'nokogiri'

class Info
  attr_accessor :page
  
  def initialize
    doc = HTTParty.get("https://www.gismeteo.ru/")
    @page = Nokogiri::HTML(doc)
  end 
  
  def get_weather
    unit_temp_xpath = '//span[@class = "unit unit_temperature_c"]'
    weather_description_xpath = '//div[@class = "weather-description"]'

    unit_temp =  @page.xpath(unit_temp_xpath)[0]
    weather_description = @page.xpath(weather_description_xpath)[0]

    weather = ''
    
    weather += unit_temp unless unit_temp.nil?
    weather += ' ' + weather_description unless weather_description.nil?

    weather
  end
end

