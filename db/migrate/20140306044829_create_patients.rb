class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :condition
      t.integer :deviceId

      t.timestamps
    end
  end
end
