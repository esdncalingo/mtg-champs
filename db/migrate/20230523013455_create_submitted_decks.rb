class CreateSubmittedDecks < ActiveRecord::Migration[7.0]
  def change
    create_table :submitted_decks do |t|
      t.references :participant, null: false, foreign_key: true
      t.string :name
      t.jsonb :cards
      t.jsonb :sideboard
      t.string :game_format

      t.timestamps
    end
  end
end
