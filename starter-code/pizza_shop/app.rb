
class PizzaShop < Sinatra::Base

  require 'json'

  # GET - Index all
  get "/pizzas" do
    @pizzas = Pizza.all.to_json
  end

  # POST - Create a new pizza
  post "/pizzas" do
    #these will eventually be real params passed from the client
    new_pizza = JSON.parse request.body.read
    @pizza = Pizza.new(new_pizza)
    @pizza.save
  end


  # GET - Show ID of one pizza
  get "/pizzas/:id" do
    @pizza = Pizza.find(params[:id]).to_json
  end


  # PUT - Update the pizza
  put "/pizzas/:id" do
    attributes_to_update = JSON.parse request.body.read
    @pizza = Pizza.find(params[:id])
    @pizza.update_attributes(attributes_to_update)
  end


  # DELETE - Destroy one pizza
  delete "/pizzas/:id" do
    @pizza = Pizza.find(params[:id])
    @pizza.destroy
  end

end
