class CreateDecks < ActiveRecord::Migration[7.0]
  def change
    create_table :decks do |t|
      t.integer :user_id
      t.string :name
      t.jsonb :cards, null: false, default: {}
      t.jsonb :sideboard, default: {}
      t.string :game_format

      t.timestamps
    end
  end
end
