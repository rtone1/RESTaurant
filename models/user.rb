class User < ActiveRecord::Base

  include BCrypt

  has_many(:parties)

  def password
    Password.new(self.password_hash)
  end

  def password=(new_password)
    self.password_hash = Password.create(new_password)
  end

  def to_s
    "I'm a user"
  end
  
end
