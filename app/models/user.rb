class User < ApplicationRecord
  # ActiveRecords Association
  has_many :decks
  has_many :events
  has_many :participants, through: :events
  has_one :profile

  # ActiveRecords Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  include Authentication
end
