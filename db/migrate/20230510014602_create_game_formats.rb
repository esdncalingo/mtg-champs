class CreateGameFormats < ActiveRecord::Migration[7.0]
  def change
    create_table :game_formats do |t|
      t.string :name
    end
  end
end