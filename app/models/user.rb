class User < ApplicationRecord
  has_many :decks
  has_many :events
  has_many :participants, through: :events
  has_one :profile
  has_and_belongs_to_many :roles
end
