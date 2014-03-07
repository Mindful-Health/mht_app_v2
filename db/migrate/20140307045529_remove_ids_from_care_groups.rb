class RemoveIdsFromCareGroups < ActiveRecord::Migration
  def change
    remove_column :care_groups, :user_id, :integer
    remove_column :care_groups, :patient_id, :integer
  end
end
