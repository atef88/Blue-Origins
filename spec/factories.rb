FactoryGirl.define do
	factory :reservation , :class => "Reservation" do
		teleport
		ignore do
			set_passenger_name "test"
		end
		passenger_name{set_passenger_name}
	end

	factory :passenger do
		ignore do
			sequence(:set_name) {|n| "Passenger#{n}" }
		end
		name { set_name }
	end

	factory :teleporter do
		ignore do
			sequence(:set_number){|n| n}
			set_num_seat 3
		end
		number{set_number}
		num_seat{set_num_seat}
	end



	factory :departure, :class => "Point" do
		ignore do
			sequence(:set_name){|n| "Departure#{n}"}
		end
		name{set_name}
	end

	factory :destination, :class => "Point" do
		ignore do
			sequence(:set_name){|n| "Destination#{n}"}
		end
		name{set_name}
	end


	factory :teleport do

		teleporter
		departure
		destination

		ignore do
			set_time Time.parse('10:00:00')
			set_date Date.parse('24 may 2014')
		end

		time { set_time}
		date { set_date}

	end


	factory :tele_pass do

		passenger
		teleport

		ignore do
		end
	end
	
end