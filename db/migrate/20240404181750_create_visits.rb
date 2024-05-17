class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.integer :work_order_id
      t.integer :contractor_id
      t.string :title
      t.string :stage
      t.date :appointment_date

      t.timestamps
    end
  end
end
