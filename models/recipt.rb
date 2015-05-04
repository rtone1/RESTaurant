class Recipt < ActiveRecord::Base

    has_many(:orders)

    def to_s
      "I print out things"
    end
    
end
