class User < ApplicationRecord 
    validates_presence_of :username, :session_token, :password_digest
    validates_uniqueness_of :username, :session_token
    before_validation :ensure_session_token
    validates_length_of :password, allow_nil: true, minimum: 5

    attr_reader :password

    def self.generate_session_token
        self.session_token = SecureRandom::urlsafe_base64
    end

    def set_activation_token
        self.activation_token = generate_session_token
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