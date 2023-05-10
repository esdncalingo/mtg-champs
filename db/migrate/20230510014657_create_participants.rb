class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.integer :user_id
      t.integer :deck_id
      t.string :status
      t.integer :event_id
      t.string :rank

      t.timestamps
    end
  end
end
