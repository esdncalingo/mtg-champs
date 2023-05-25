class Participant < ApplicationRecord
  # ActiveRecords Associations
  belongs_to :user
  belongs_to :event
  has_one :submitted_deck

  # Validations
  validates :user_id, uniqueness: { scope: :event_id, message: 'has already joined this event.' }

  # ActionCable Broadcast
  after_create_commit :broadcast_participant

  private

  def broadcast_participant
    ActionCable.server.broadcast "ParticipantsChannel", self
  end
end
