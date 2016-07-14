require 'json'
require "./models/pizza.rb"

class PizzaShop < Sinatra::Base
	# General route actions
	get '/pizzas' do
		@all_pizzas = Pizza.all
		@all_pizzas.to_json
	end

	post '/pizzas' do
		request.body.rewind
        new_pizza = request.body.read
        parsed_pizza = JSON.parse(new_pizza)
		Pizza.create(parsed_pizza)
	end
end
