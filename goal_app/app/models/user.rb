class User < ApplicationRecord 
    validates_presence_of :username, :session_token, :password_digest
    validates_uniqueness_of :username, :session_token

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

end