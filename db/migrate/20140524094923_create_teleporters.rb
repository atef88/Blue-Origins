class CreateTeleporters < ActiveRecord::Migration
  def change
    create_table :teleporters do |t|
      t.string :status
      t.boolean :broken , defualt: false
      t.integer :num_seat , defualt: "3"

      t.timestamps
    end
  end
end
