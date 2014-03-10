class CareGroup < ActiveRecord::Base
	belongs_to :patients
	belongs_to :users
end