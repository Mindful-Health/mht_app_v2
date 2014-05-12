FactoryGirl.define do
	factory :patient do
		name     "Michael Hartl"
	    email    "michael@example.com"
	    phone "foobar"
	    condition "foobar"
	    deviceId '1'
	end

	factory :care_group do
		name "Michael Hartl"
	end
end
