class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.integer :work_order_id
      t.integer :admin_user_id
      t.string :title
      t.boolean :is_done
      t.date :due_date

      t.timestamps
    end
  end
end
