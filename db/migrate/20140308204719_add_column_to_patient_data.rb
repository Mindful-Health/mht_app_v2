class AddColumnToPatientData < ActiveRecord::Migration
  def change
    add_column :patient_data, :patient_id, :integer
  end
end
