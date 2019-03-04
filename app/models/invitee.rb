require 'digest'
require 'csv'

class Invitee < ApplicationRecord
  belongs_to :group
  validates :name, :email, presence: true
  before_create :generate_code

  def generate_code
    self.code = Digest::SHA256.base64digest(self.email + self.name)[0..20]
  end

  def self.import_csv(file)
    CSV.parse(file, :headers => true, :encoding => 'ISO-8859-1').each do |row|
      hashed_row = row.to_hash
      group = Group.find_or_initialize_by(id: hashed_row["group_id"].to_i)
      if group.new_record?
        group.name = hashed_row["name"]
        group.save
      end
      Invitee.create!(hashed_row)
    end
  end
end
