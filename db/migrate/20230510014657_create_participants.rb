class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :deck_id
      t.string :status
      t.string :rank
    end
  end
end
