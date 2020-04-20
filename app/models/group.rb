class Group < ApplicationRecord
  belongs_to :user
  belongs_to :game, required: false

  has_many :invites
end
