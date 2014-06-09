# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Passenger.delete_all

TelePass.delete_all

Point.delete_all
Point.create(:id => 1 , :name => "London")
Point.create(:id => 2 , :name => "Tokyo")
Point.create(:id => 3 , :name => "Paris")
Point.create(:id => 4 , :name => "New York")


Teleporter.delete_all
Teleporter.create(:id => 1 , :number => 1 , :num_seat => 3)
Teleporter.create(:id => 2 , :number => 2 , :num_seat => 3)
Teleporter.create(:id => 3 , :number => 3 , :num_seat => 3)


Teleport.delete_all
Teleport.create(:teleporter_id => 1 ,:departure_id => 1 , :destination_id => 2 , :time => Time.parse('10:00:00') , :date => Date.parse('24 may 2014') )
Teleport.create(:teleporter_id => 2 ,:departure_id => 1 , :destination_id => 2 , :time => Time.parse('10:00:00') , :date => Date.parse('24 may 2014') )
Teleport.create(:teleporter_id => 3 ,:departure_id => 2 , :destination_id => 1 , :time => Time.parse('10:00:00') , :date => Date.parse('24 may 2014') )

Teleport.create(:teleporter_id => 1 ,:departure_id => 1 , :destination_id => 3 , :time => Time.parse('14:00:00') , :date => Date.parse('24 may 2014') )
Teleport.create(:teleporter_id => 2 ,:departure_id => 2 , :destination_id => 3 , :time => Time.parse('14:00:00') , :date => Date.parse('24 may 2014') )
Teleport.create(:teleporter_id => 3 ,:departure_id => 3 , :destination_id => 2 , :time => Time.parse('14:00:00') , :date => Date.parse('24 may 2014') )

Teleport.create(:teleporter_id => 1 ,:departure_id => 2 , :destination_id => 3 , :time => Time.parse('20:00:00') , :date => Date.parse('24 may 2014') )
Teleport.create(:teleporter_id => 2 ,:departure_id => 3 , :destination_id => 2 , :time => Time.parse('20:00:00') , :date => Date.parse('24 may 2014') )
Teleport.create(:teleporter_id => 3 ,:departure_id => 1 , :destination_id => 2 , :time => Time.parse('20:00:00') , :date => Date.parse('24 may 2014') )

Teleport.create(:teleporter_id => 1 ,:departure_id => 1 , :destination_id => 2 , :time => Time.parse('00:00:00') , :date => Date.parse('24 may 2014') )
Teleport.create(:teleporter_id => 2 ,:departure_id => 2 , :destination_id => 3 , :time => Time.parse('00:00:00') , :date => Date.parse('24 may 2014') )
Teleport.create(:teleporter_id => 3 ,:departure_id => 3 , :destination_id => 4 , :time => Time.parse('00:00:00') , :date => Date.parse('24 may 2014') )

Teleport.create(:teleporter_id => 1 ,:departure_id => 3 , :destination_id => 4 , :time => Time.parse('16:00:00') , :date => Date.parse('24 may 2014') )
Teleport.create(:teleporter_id => 2 ,:departure_id => 4 , :destination_id => 1 , :time => Time.parse('16:00:00') , :date => Date.parse('24 may 2014') )
Teleport.create(:teleporter_id => 3 ,:departure_id => 2 , :destination_id => 4 , :time => Time.parse('16:00:00') , :date => Date.parse('24 may 2014') )


Teleport.create(:teleporter_id => 1 ,:departure_id => 4 , :destination_id => 2 , :time => Time.parse('06:00:00') , :date => Date.parse('24 may 2014') )
Teleport.create(:teleporter_id => 2 ,:departure_id => 1 , :destination_id => 4 , :time => Time.parse('06:00:00') , :date => Date.parse('24 may 2014') )
Teleport.create(:teleporter_id => 3 ,:departure_id => 3 , :destination_id => 1 , :time => Time.parse('06:00:00') , :date => Date.parse('24 may 2014') )