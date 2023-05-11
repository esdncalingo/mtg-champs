class Participant < ApplicationRecord
  belongs_to :event
  has_and_belongs_to_many :users
  has_and_belongs_to_many :decks
end
