class Partie < ActiveRecord::Base
  #relationships
  has_many(:orders)
  has_many(:foods, through: :orders)
  belongs_to(:user)


  def to_s
    "I'm a partie"
  end
end
