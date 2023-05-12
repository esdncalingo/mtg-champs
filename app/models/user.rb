class User < ApplicationRecord
  # ActiveRecords Association
  has_many :decks
  has_many :events
  has_many :participants, through: :events
  has_one :profile
  has_and_belongs_to_many :roles

  # ActiveRecords Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  include Authentication
end
