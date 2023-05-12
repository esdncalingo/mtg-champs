# app/models/user/authentication.rb
module Authentication
  include BCrypt
  extend ActiveSupport::Concern

  included do
    def self.create_account(parameters)
      hash_password = Password.create(parameters[:password])
      @user = create(
        email: parameters[:email],
        password: hash_password,
        nickname: parameters[:nickname]
      )
      return @user, @user.errors.full_messages if @user.errors.present?
    end

    def self.generate_token(parameters)
      @user = find_by(email: parameters[:email])
      @token = SecureRandom.hex(20)
      if @user.present?
        return @user, @token if Password.new(@user.password) == parameters[:password]
      end
    end
  end
end
