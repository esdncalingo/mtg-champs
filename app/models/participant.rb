class Participant < ApplicationRecord
  # ActiveRecords Associations
  belongs_to :event
  has_and_belongs_to_many :users
  has_and_belongs_to_many :decks

  # ActiveRecords Validations
  validates :user_id, presence: true
  validates :deck_id, presence: true
  validates :event_id, presence: true
end
