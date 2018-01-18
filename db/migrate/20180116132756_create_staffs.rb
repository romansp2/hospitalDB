class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :sname
      t.string :bday
      t.string :position

      t.timestamps
    end
  end
end
