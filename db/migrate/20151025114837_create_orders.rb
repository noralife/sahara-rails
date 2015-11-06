class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :product_id
      t.string :status

      t.timestamps null: false
    end
  end
end
