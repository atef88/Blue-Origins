class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :name , null: false

      t.timestamps
    end
    add_index :passengers , :name , unique: true
  end
end
