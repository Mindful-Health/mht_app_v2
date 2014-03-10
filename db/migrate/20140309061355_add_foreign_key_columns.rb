class AddForeignKeyColumns < ActiveRecord::Migration
  def change
  	add_column :care_groups, :patient_id, :integer
  	add_column :care_groups, :user_id, :integer
  end
end
