class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :room_number
      t.integer :floor
      t.integer :quantity_of_beds
      t.enum :standard
      t.integer :price
    end
  end
end
