class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.date :begin_date, null: false, default: Date.current
      t.date :end_date, null: false, default: Date.current + 1.day
      t.belongs_to :room, index: true, null: false, default: 0
      t.belongs_to :client, index: true,  null: false, default: 0
      t.integer :quantity_of_beds, null: false, default: 1
      t.timestamps null: false
    end
  end
end
