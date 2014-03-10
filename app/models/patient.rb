class Patient < ActiveRecord::Base
	has_many :care_group
	has_many :patient_data
end
