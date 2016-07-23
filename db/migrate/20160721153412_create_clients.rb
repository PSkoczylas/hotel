class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :first_name,   null: false, default: ""
      t.string :last_name,    null: false, default: ""
      t.string :email,                     default: ""
      t.string :phone_number, null: false, default: ""
      t.timestamps null: false
    end
  end
end
