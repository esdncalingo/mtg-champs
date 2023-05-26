class Event < ApplicationRecord
  # ActiveRecords Associations
  belongs_to :user
  has_many :participants
  has_many :users, through: :participants
  
  # ActiveRecords Validations
  validates :title, presence: true
  validates :schedule, presence: true
  validate :event_not_finished, on: :create

  # ActionCable
  after_create_commit :broadcast_events

  def event_not_finished
    if Event.exists?(user_id: user_id, finished: false)
      errors.add(:event, "You already have an ongoing event.")
    end
  end

  private

  def broadcast_events
    ActionCable.server.broadcast "EventsChannel", self
  end
end
