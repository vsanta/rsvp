require 'digest'
require 'csv'

class Invitee < ApplicationRecord
  belongs_to :group
  validates :name, presence: true
  before_create :generate_code

  def generate_code
    self.code = Digest::SHA256.base64digest(email.to_s)[0..20] unless email.nil?
  end
end
