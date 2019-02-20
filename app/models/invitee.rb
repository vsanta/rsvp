class Invitee < ApplicationRecord
  belongs_to :group
  validates :name, :email, presence: true
end
