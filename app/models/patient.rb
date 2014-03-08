class Patient < ActiveRecord::Base
	belongs_to :care_group
	has_many :patient_data
end
