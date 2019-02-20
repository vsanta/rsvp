class CreateInvitees < ActiveRecord::Migration[5.2]
  def change
    create_table :invitees do |t|
      t.string :name
      t.string :email
      t.integer :group_id

      t.timestamps
    end
  end
end
