class CreatePatientData < ActiveRecord::Migration
  def change
    create_table :patient_data do |t|
      t.integer :device_id
      t.decimal :spo2
      t.decimal :heart_rate
      t.timestamp :transmission_time

      t.timestamps
    end
  end
end
