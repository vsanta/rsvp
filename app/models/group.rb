class Group < ApplicationRecord
  has_many :invitees
  validates :name, presence: true
end
