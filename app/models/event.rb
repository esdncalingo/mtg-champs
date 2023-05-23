class Event < ApplicationRecord
  # ActiveRecords Associations
  belongs_to :user
  has_many :participants
  has_many :users, through: :participants
  
  # ActiveRecords Validations
  validates :title, presence: true
  validates :schedule, presence: true
end
