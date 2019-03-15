class AddNicknameToInvittes < ActiveRecord::Migration[5.2]
  def change
    add_column :invitees, :nickname, :string
  end
end
