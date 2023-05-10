class CreateDecks < ActiveRecord::Migration[7.0]
  def change
    create_table :decks do |t|
      t.integer :user_id
      t.string :name
      t.text :cards, array: true, default: []
      t.text :sideboard, array: true, default: []
      t.integer :game_format_id

      t.timestamps
    end
  end
end
