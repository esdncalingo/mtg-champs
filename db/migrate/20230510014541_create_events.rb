class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.datetime :schedule
      t.integer :game_format_id

      t.timestamps
    end
  end
end
