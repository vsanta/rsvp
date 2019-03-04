class AddAgetoInvitee < ActiveRecord::Migration[5.2]
  def change
    add_column :invitees, :age, :integer
  end
end
