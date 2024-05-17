class CreateWorkOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :work_orders do |t|
      t.string :title
      t.string :description
      t.string :address

      t.timestamps
    end
  end
end
