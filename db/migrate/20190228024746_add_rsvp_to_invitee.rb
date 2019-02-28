class AddRsvpToInvitee < ActiveRecord::Migration[5.2]
  def change
    add_column :invitees, :rsvp, :boolean
  end
end
