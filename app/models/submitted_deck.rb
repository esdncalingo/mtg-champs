class SubmittedDeck < ApplicationRecord
  belongs_to :participant

  after_create_commit :broadcast_participant

  def broadcast_participant
    participant = Participant.find(participant_id)
    @query = {
      id: participant_id,
      nickname: participant.user.nickname,
      deck_name: name,
      cards: cards,
      sideboard: sideboard,
      status: participant.status
    }

    ActionCable.server.broadcast "ParticipantsChannel", @query
  end
end
