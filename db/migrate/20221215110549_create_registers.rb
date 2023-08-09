class CreateRegisters < ActiveRecord::Migration[6.1]
  def change
    create_table :registers do |t|
      t.string :roomName
      t.string :roomAddress
      t.text :roomIntroduction
      t.integer :roomMoney
      t.integer :user_id
      t.integer :room_id
      t.string :registerImage 
      t.integer :number
      t.date :end_date
      t.date :start_date

      t.timestamps
    end
  end
end
