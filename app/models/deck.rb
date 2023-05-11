class Deck < ApplicationRecord
  belongs_to :user
  has_one :participant
  has_and_belongs_to_many :game_formats
end
