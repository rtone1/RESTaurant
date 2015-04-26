class Order < ActiveRecord::Base
  #relationships
  belongs_to(:partie)
  belongs_to(:food)
  def to_s
    "I'm a order"
  end
end
