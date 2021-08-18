# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  username        :string           not null
#
class User < ApplicationRecord
    validates_presence_of :email, :password_digest, :session_token
    validates_uniqueness_of :session_token
    validates :password, length: {minimum: 6, allow_nil: true}

    attr_reader :password

    # Remember that in the User model, you'll want to use an after_initialize 
        # callback to set the session_token before validation if it's not present.
    after_initialize :ensure_session_token


    def self.generate_session_token
    end

    #SPIRE
    #S
    def self.find_by_credentials(email,password)
        user = User.find_by(email: email)

        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end

    #P
    def password=(password)
        @password = password
        # create a bcrypted password from user-input password and assign it to password_digest variable
        self.password_digest = BCrypt::Password.create(password)
    end

    #I
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    #R
    def reset_session_token!
        # generates random # in Base64 string (length=16) for generating session key in HTTP cookies
        self.session_token = SecureRandom.urlsafe_base64(16)
        self.save!
        self.session_token
    end

    private
    #E
    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64(16)
    end













end
