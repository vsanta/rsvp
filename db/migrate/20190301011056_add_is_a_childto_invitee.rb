class AddIsAChildtoInvitee < ActiveRecord::Migration[5.2]
  def change
    add_column :invitees, :is_a_child, :boolean, default: false
  end
end
