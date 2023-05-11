class GameFormat < ApplicationRecord
  # ActiveRecords Associations
  has_and_belongs_to_many :decks
  has_and_belongs_to_many :events
end
