require 'rails_helper'

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { BCrypt::Password.create('password123') }
  end
  factory :client do
    token { Faker::Lorem.characters(number: 10) }
  end
  factory :event do
    title { 'New Event' }
    game_format { 'standard' }
    schedule { DateTime.now }
  end
end