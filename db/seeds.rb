# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

2520.times do |i|
PatientData.create(device_id: 1, spo2: (80+Random.rand(105-80)), heart_rate: (50+Random.rand(105-50)), 
					transmission_time: Time.at(13941612+(i*900)).to_datetime, patient_id: 1)

end
