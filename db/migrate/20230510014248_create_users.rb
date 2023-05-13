class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :nickname
      t.string :role, default: 'player'
      t.string :password
      t.string :access_token
      t.datetime :expiration
      t.timestamps
    end
  end
end
