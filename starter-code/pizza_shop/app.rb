require 'json'

class PizzaShop < Sinatra::Base

  #index route
  get '/' do

    erb :index
  end


  #RESTful api routes

  #index - show all
  get '/pizzas' do
    content_type :json
    @pizzas = Pizza.all
    @pizzas.to_json
  end

  #create - a new pizza
  post '/pizzas' do
    body = JSON.parse request.body.read
    @pizza = Pizza.new(body)
    @pizza.save

  end

  #show - show one :id
  get '/pizzas/:id' do
    content_type :json
    @pizza_id = Pizza.find(params[:id].to_i)
    @pizza_id.to_json
  end

  #update - update a pizza
  put '/pizzas/:id' do
    body = JSON.parse request.body.read
    @find_pizza = Pizza.find(params[:id])
    @find_pizza.update_atrributes(body)
  end

  #destroy pizza
  delete '/pizzas/:id' do
    @pizza = Pizza.find(params[:id])
    @pizza.destroy
  end



end
