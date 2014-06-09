class AddNotNullToNumberColumnInTeleporter < ActiveRecord::Migration
  def change
  	change_column :teleporters, :number , :integer , :null => false ,:unique => true
  end
end
