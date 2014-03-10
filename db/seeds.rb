# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Patient_Data.create(device_id: 1, spo2: 85, heart_rate: 88, 
					transmission_time: DateTime.new(2014, 3, 9, 3, 3, 43, 0), patient_id: 1)
