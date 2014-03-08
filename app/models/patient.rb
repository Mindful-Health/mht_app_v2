class Patient < ActiveRecord::Base
	belongs_to :care_group
end
