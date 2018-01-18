class CreateHospitalsStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals_staffs, id: false do |t|
     t.integer :hospital_id
     t.integer :staff_id
    end
  end
end
