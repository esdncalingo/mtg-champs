class Event < ApplicationRecord
  # ActiveRecords Associations
  belongs_to :user
  has_many :participants
  has_and_belongs_to_many :game_formats

  # ActiveRecords Validations
  validates :title, presence: true
end
