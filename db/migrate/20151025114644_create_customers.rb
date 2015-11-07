class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :token
      t.string :role

      t.timestamps null: false
    end
  end
end
