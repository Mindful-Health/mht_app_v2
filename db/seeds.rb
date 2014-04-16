# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@prev_spo2
@prev_heart
672.times do |i|

	@i = i
	if (@i == 0)
		@prev_spo2 = 93
		@prev_heart = 70

		PatientData.create(device_id: 1, spo2: 93, heart_rate: 70, 
						transmission_time: Time.at(13941612+(i*900)).to_datetime, patient_id: 1)
	else
		@factor_spo2 = [0.95, 1.05].sample
		@factor_hr = [0.93, 1.07].sample
		@prev_spo2 = @prev_spo2*@factor_spo2
		@prev_heart = @prev_heart*@factor_hr


		PatientData.create(device_id: 1, spo2: @prev_spo2, heart_rate: @prev_heart, 
						transmission_time: Time.at(13941612+(i*900)).to_datetime, patient_id: 1)
	end



end
