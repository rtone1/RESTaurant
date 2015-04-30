# get bundler
require 'bundler'
Bundler.require()

#make connection
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restaurant'
)

# sessions
enable(:sessions)

# get models
require './models/manager'
require './models/user'
require './models/partie'
require './models/order'
require './models/food'
require './models/recipt'

# make helpers

# make certain featers only for managers
def current_user
  if session[:current_user]
    User.find(session[:current_user])
  else
    nil
  end
end

def authenticate!
  redirect '/sign_up' unless current_user
end



# GET	/	Displays the waitstaff's application
get '/' do
    if current_user
      erb :POSmain
    else
      erb :log_in
    end
end

get '/sign_up' do
  erb :sign_up
end


#===============================================================================
# #set routes for managers
# #Get /api/managers All the managers
# get '/api/managers' do
#   content_type :json
#   man = Manager.all
#   man.to_json
# end
# #Get /api/managers/:id  A single manager
# get '/api/managers/:id' do
#   content_type :json
#   man = Manager.find(params[:id].to_i)
#   man.to_json
# end
# #Post /api/managers  Make a manager
# post '/managers' do
#   content_type :json
#   man = Manager.new(params[:manager])
#   man.password = params[:password]
#   man.save!
#   man.to_json
#   redirect '/'
# end
#
# post '/sessions' do
#   man = Manager.find_by(name: params[:name])
#   if (man.password == params[:password])  # Does the password match?
#     session[:current_user] = user.id
#     redirect '/' # Authenticated
#   else
#     redirect '/' # Not Authenticated
#   end
# end
# #Patch /api/managers/:id  Update a manager
# patch '/api/managers/:id' do
#   content_type :json
#   man = Manager.find(params[:id].to_i)
#   man.update(params[:manager])
#   man.to_json
# end
# #Delete /api/managers/:id Delete a manager
# delete '/api/managers/:id' do
#   content_type :json
#   Manager.find(params[:id].to_i)
#   {message: 'Successfully Deleted'}.to_json
# end
#
# delete '/sessions' do
#   session[:current_user] = nil
#   redirect '/'
# end
#===============================================================================
#set routes for users
#Get /api/users All the user
get '/api/users' do
  content_type :json
  user = User.all
  user.to_json
end
#Get /api/users/:id  A single user
get '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.to_json
end
#Post /api/users  Make a user
post '/users' do
  content_type :json
  user = User.new(params[:user])
  user.password = params[:password]
  user.save!
  redirect '/'
end

post '/sessions' do
  user = User.find_by(username: params[:username])
  if (user.password == params[:password])  # Does the password match?
    session[:current_user] = user.id
    redirect '/' # Authenticated
  else
    redirect '/' # Not Authenticated
  end

end
#Patch /api/users/:id  Update a user
patch '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end
#Delete /api/users/:id Delete a user
delete '/api/users/:id' do
  content_type :json
  User.find(params[:id].to_i)
  {message: 'Successfully Deleted'}.to_json
end

delete '/sessions' do
  session[:current_user] = nil
  redirect '/'
end
#===============================================================================
#set routes for foods
# GET	/api/foods	All food items available
get '/api/foods' do
  content_type :json
  food = Food.all
  food.to_json
end
# GET	/api/foods/:id	A single food item and all the parties that included it
get '/api/foods/:id' do
  content_type :json
  food = Food.find(params[:id].to_i)
  food.to_json
end
# POST	/api/foods	Creates a new food item
post '/api/foods' do
  content_type :json
  food = Food.create(params[:food])
  food.to_json
  redirect '/'
end
# PATCH	/api/foods/:id	Updates a food item
patch '/api/foods/:id' do
  content_type :json
  food = Food.find(params[:id].to_i)
  food.update(params[:food])
  food.to_json
end
# PUT	/api/foods/:id	Updates a food item
put '/api/foods/:id' do
  content_type :json
  food = Food.find(params[:id].to_i)
  food.update(params[:food])
  food.to_json
end
# DELETE	/api/foods/:id	Deletes a food item
delete '/api/foods/:id' do
  content_type :json
  Food.delete(params[:id].to_i)
  {message: 'Successfully Deleted'}.to_json
end
#===============================================================================
#set routes for parties
# GET	/api/parties	All parties
get '/api/parties' do
  content_type :json
  partie = Partie.all
  partie.to_json(:include => [:foods])
end
# GET	/api/parties/:id	A single party and all the orders it contains
get '/api/parties/:id' do
  content_type :json
  partie = Partie.find(params[:id].to_i)
  partie.to_json
end
# POST	/api/parties	Creates a new party
post '/api/parties' do
  content_type :json
  partie = Partie.create(params[:partie])
  partie.to_json
end
# PATCH	/api/parties/:id	Updates a party's details
patch '/api/parties/:id' do
  content_type :json
  partie = Partie.find(params[:id].to_i)
  partie.update(params[:partie])
  partie.to_json
end
# PUT	/api/parties/:id	Updates a party's details
put '/api/parties/:id' do
  content_type :json
  partie = Partie.find(params[:id].to_i)
  partie.update(params[:partie])
  partie.to_json
end
# DELETE	/api/parties/:id	Delete a party
delete '/api/parties/:id' do
  content_type :json
  Partie.delete(params[:id].to_i)
  {message: 'Successfully Deleted'}.to_json
end
#===============================================================================
#set routes for orders
# POST	/api/orders	Creates a new order
get '/api/orders' do
  content_type :json
  order = Order.all
  order.to_json(:include => [:partie, :food])
end
# POST	/api/orders	Creates a new order
post '/api/orders' do
  content_type :json
  order = Order.create(params[:order])
  order.to_json(:include => [:partie, :food])
end
# PATCH	/api/orders/:id	Change item to no-charge
patch '/api/orders/:id' do
  content_type :json
  order = Order.find(params[:id].to_i)
  order.update(params[:order])
  order.to_json
end
# DELETE	/api/orders/:id	Removes an order
delete '/api/orders/:id' do
  content_type :json
  Order.delete(params[:id].to_i)
  {message: 'Successfully Deleted'}.to_json
end
#===============================================================================
#set routes for checkout
# GET	/api/parties/:id/receipt	Saves the party's receipt data to a file.
get '/api/parties/:id/receipt' do
  content_type :json
  partie = Partie.find(params[:id].to_i)
  orders = Order.all
  receipt = partie.orders
  receipt.to_json(:include => [:food])
end
# PATCH	/api/parties/:id/ checkout	Marks the party as paid
patch '/api/parties/:id/checkout' do
  content_type :json
  partie = Partie.find(params[:id].to_i)
  partie.payment = true
  partie.save!
  partie.to_json
end
# PUT	/api/parties/:id/ checkout
put '/api/parties/:id/checkout' do
  content_type :json
  partie = Partie.find(params[:id].to_i)
  partie.payment = true
  partie.save!
  partie.to_json
end
