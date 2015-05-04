class Manager < ActiveRecord::Base
  
  include BCrypt

    has_many(:parties)
    has_many(:users)

    def password
      Password.new(self.password_hash)
    end

    def password=(new_password)
      self.password_hash = Password.create(new_password)
    end

    def to_s
      "I manage you"
    end
end
