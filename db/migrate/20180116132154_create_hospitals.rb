class CreateHospitals < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals do |t|
      t.integer :num

      t.timestamps
    end
  end
end
