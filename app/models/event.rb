class Event < ApplicationRecord
  # ActiveRecords Associations
  belongs_to :user
  has_many :participants

  # ActiveRecords Validations
  validates :title, presence: true
end
