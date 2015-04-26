class User < ActiveRecord::Base
  #relationships
  has_many(:parties)

  def to_s
    "I'm a user"
  end
end
