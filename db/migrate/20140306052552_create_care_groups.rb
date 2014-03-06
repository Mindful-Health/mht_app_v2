class CreateCareGroups < ActiveRecord::Migration
  def change
    create_table :care_groups do |t|
      t.integer :user_id
      t.integer :patient_id


      t.timestamps
    end
    add_index :care_groups, :user_id
    add_index :care_groups, :patient_id
    add_index :care_groups, [:user_id, :patient_id], unique: true
  end
end
