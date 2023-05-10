class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :nickname
      t.boolean :active
      t.integer :role_id
      t.string :password
      t.string :token

      t.timestamps
    end
  end
end
