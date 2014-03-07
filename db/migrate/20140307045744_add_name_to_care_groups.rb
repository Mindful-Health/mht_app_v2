class AddNameToCareGroups < ActiveRecord::Migration
  def change
    add_column :care_groups, :name, :string
  end
end
