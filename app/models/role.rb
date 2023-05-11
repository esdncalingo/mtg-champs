class Role < ApplicationRecord
  # ActiveRecords Associations
  has_and_belongs_to_many :users
end
