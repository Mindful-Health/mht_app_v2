class CreateCareGroups < ActiveRecord::Migration
  def change
    create_table :care_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
