class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :contacts
      t.boolean :status
      t.integer :salary

      t.timestamps null: false
    end
  end
end
