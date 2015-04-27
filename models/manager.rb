class Manager < ActiveRecord::Base
  #relationships
    has_many(:parties)
    has_many(:users)

    def to_s
      "I manage you"
    end
end
