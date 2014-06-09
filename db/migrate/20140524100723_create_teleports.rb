class CreateTeleports < ActiveRecord::Migration
  def change
    create_table :teleports do |t|
      t.integer :teleporter_id, null: false , index: true
      t.integer :departure_id , null: false
      t.integer :destination_id , null: false
      t.time :time , index: true
      t.date :date , index: true
      t.integer :avail_seat , :default => 3 , index: true

      t.timestamps
    end
    add_index :teleports,[:teleporter_id,:date,:time], :unique => true
    add_index :teleports,[:departure_id,:destination_id]

  end
end
