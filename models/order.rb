class Order < ActiveRecord::Base

  belongs_to(:partie)
  belongs_to(:food)
  belongs_to(:recipt)

  def to_s
    "I'm a order"
  end
end
