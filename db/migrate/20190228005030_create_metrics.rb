class CreateMetrics < ActiveRecord::Migration[5.2]
  def change
    create_table :metrics do |t|
      t.boolean :sent
      t.boolean :received
      t.boolean :responded
      t.references :invitee, foreign_key: true

      t.timestamps
    end
  end
end
