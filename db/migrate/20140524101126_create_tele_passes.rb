class CreateTelePasses < ActiveRecord::Migration
  def change
    create_table :tele_passes do |t|
      t.integer :teleport_id
      t.integer :passenger_id

      t.timestamps
    end
    add_index :tele_passes , :passenger_id , :unique => true
    add_index :tele_passes , :teleport_id
  end
end
