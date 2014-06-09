class AddNumberToTeleporter < ActiveRecord::Migration
  def change
  	add_column :teleporters , :number , :integer , :unique => true
  	add_index :teleporters , :number 
  end
end
