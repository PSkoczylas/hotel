class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :room_number, default: 0, null: false
      t.integer :floor, default: 0, null: false
      t.integer :quantity_of_beds, default: 0, null: false
      t.integer :standard, default: 0, null: false
      t.integer :price, default: 0
    end
  end
end
