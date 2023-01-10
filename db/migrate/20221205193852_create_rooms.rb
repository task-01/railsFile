class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :roomName
      t.string :roomAddress
      t.text :roomIntroduction
      t.integer :roomMoney
      t.integer :user_id
      t.string :email
      t.string :encrypted_password, null: false, default: ""
      t.string :image

      
      t.timestamps
    end
  end
end
