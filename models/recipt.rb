class Recipt < ActiveRecord::Base
  #realationships
    has_many(:orders)
    
    def to_s
      "I print out things"
    end
end
