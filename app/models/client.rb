class Client < ApplicationRecord
  after_create :generate_token

  def generate_token 
    self.token = SecureRandom.hex(20)

    self.save
  end
end
