class Deck < ApplicationRecord
  # ActiveRecords Associations
  belongs_to :user
  has_one :participant

  # ActiveRecords Validations
  validates :name, presence: true
end
