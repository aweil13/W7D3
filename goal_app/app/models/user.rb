class User < ApplicationRecord 
    validates_presence_of :username, :session_token, :password_digest
    validates_uniqueness_of :username, :session_token

    def self.generate_session_token
        self.session_token = SecureRandom::urlsafe_base64
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end

end