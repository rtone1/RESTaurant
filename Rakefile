# ***** GEMS *****
require 'bundler/setup'
Bundler.require

# ***** CONNECTION *****
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restaurant'
)

# ***** MODELS *****
require './models/partie'
require './models/food'
require './models/order'
require './models/user'



namespace :db do

  desc "Create Admin User"
  task :create_user do
    user = User.new({username: 'steve'})
    user.password='qwer1234'
    user.save!
  end

  desc "Fill Database some Junk Data"
  task :junk_data do

    # # Generate random Food
    # foods_starting = ['Chicken', 'Veggie', 'Beef', 'Rice']
    # food_ending = ['Salad', 'Soup', 'Plate', 'Bowl']
    # cuisines = ['Lite', 'Homecooking', 'Party', 'Bar Food']
    # rand(5..9).times do
    #   Food.create({
    #       name: ( foods_starting.sample + ' ' + food_ending.sample),
    #       price: rand(5..15),
    #       meal_type: cuisines.sample
    #   })
    # end

    # Generate random Parties
    rand(5..7).times do |num|
      Partie.create({
        table_num: num,

      })
    end

    # # Generate random Orders
    # parties = Partie.all
    # foods = Food.all
    # rand(10..35).times do |num|
    #   Order.create({
    #     partie: parties.sample,
    #     food: foods.sample
    #   })
    # end

  end # task :junk_data

  desc "Empty Database"
  task :empty do
    Order.destroy_all
    # Food.destroy_all
    # Partie.destroy_all
  end # task :empty

end # namespace :db
