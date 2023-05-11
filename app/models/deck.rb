class Deck < ApplicationRecord
  # ActiveRecords Associations
  belongs_to :user
  has_one :participant
  has_and_belongs_to_many :game_formats

  # ActiveRecords Validations
  validates :name, presence: true

end
