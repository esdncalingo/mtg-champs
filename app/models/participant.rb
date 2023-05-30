class Participant < ApplicationRecord
  # ActiveRecords Associations
  belongs_to :user
  belongs_to :event
  has_one :submitted_deck, dependent: :destroy

  # Validations
  validates :user_id, uniqueness: { scope: :event_id, message: 'has already joined this event.' }

  def self.event_participants(id)
    @participants = self
      .includes(:user, :submitted_deck)
      .where(event_id: id)
      .pluck('participants.id, users.nickname, submitted_decks.name, submitted_decks.cards, submitted_decks.sideboard, participants.status')

    @participants.map do |participant|    
      {
        id: participant[0],
        nickname: participant[1],
        deck_name: participant[2],
        cards: participant[3],
        sideboard: participant[4],
        status: participant[5]
      }
    end
  end

  def self.approved(id)
    @event = Event.find(id)
    @participants = @event.users
                       .where(participants: { status: 'approved' })
                       .select(:id, :nickname)
                       .as_json(only: [:id, :nickname], root: false)
                       .map { |participant| { name: participant['nickname'], id: participant['id'], isWinner: false, resultText: '' } }
    
    return @participants
  end
 
end
