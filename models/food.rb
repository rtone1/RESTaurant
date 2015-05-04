class Food < ActiveRecord::Base

  has_many(:orders)
  has_many(:parties, through: :orders)
  
  def to_s
    "I'm a food item"
  end
end
