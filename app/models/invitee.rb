require 'digest'
class Invitee < ApplicationRecord
  belongs_to :group
  validates :name, presence: true
  before_create :generate_code

  def generate_code
    self.code = SecureRandom.urlsafe_base64
  end
end
