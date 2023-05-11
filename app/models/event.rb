class Event < ApplicationRecord
  belongs_to :user
  has_many :participants
  has_and_belongs_to_many :game_formats
end
