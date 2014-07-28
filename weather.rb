require 'yahoo_weatherman'
require 'sinatra'

def weatherman(user_location)
	client = Weatherman::Client.new
	celsius_result = client.lookup_by_location(user_location).condition['temp']
	fahrenheit_result = ((celsius_result * 9) / 5) + 32
end

def conditions(user_location)
	client = Weatherman::Client.new
	client.lookup_by_location(user_location).condition['text']
end


get '/' do
#	location = params[:location]
#	your_location = get_location(location)
#	@message = weatherman(your_location)
#	@conditions = conditions(your_location)
#	"The temperature is #{@message} degrees Fahrenheit. It is #{@conditions}"
	erb :home
end

post '/weather' do
	@post = params[:post] ['location']

	@temperature = weatherman(@post)
	@conditions = conditions(@post)

    "#{@weather}"
    "#{@conditions}"
    
    if (@conditions == 'Sunny' || @conditions == 'Sun')
        erb :sunny
    elsif (@conditions == 'Cloudy'|| @conditions == 'Mostly Cloudy' || @conditions == 'Partly Cloudy')
        erb :cloudy
    elsif (@conditions == 'Snowy' || @conditions == 'Heavy Snow' || @conditions == 'Blowing Snow')
        erb :snowy
    elsif (@conditions == 'Light Rain' || @conditions == 'Showers' || @conditions == 'showers' || @conditions == 'Rain')
    	erb :rainy
    else
        erb :default
    end
end




