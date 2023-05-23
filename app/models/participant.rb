class Participant < ApplicationRecord
  # ActiveRecords Associations
  belongs_to :user
  belongs_to :event
  has_one :submitted_deck

  # ActionCable Broadcast
  after_create_commit :broadcast_participant

  private

  def broadcast_participant
    ActionCable.server.broadcast "ParticipantsChannel", self
  end
end
