class Event < ApplicationRecord
  # ActiveRecords Associations
  belongs_to :user
  has_many :participants
  has_many :users, through: :participants
  
  # ActiveRecords Validations
  validates :title, presence: true
  validates :schedule, presence: true

  # ActionCable
  after_create_commit :broadcast_events

  private

  def broadcast_events
    ActionCable.server.broadcast "EventsChannel", self
  end
end
