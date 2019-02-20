require 'digest'
class Invitee < ApplicationRecord
  belongs_to :group
  validates :name, :email, presence: true

  before_create :generate_code

  def generate_code
    self.code = Digest::SHA256.base64digest(self.email)[0..20]
  end
end
