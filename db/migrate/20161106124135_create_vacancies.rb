class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name
      t.date :expiration_date
      t.integer :salary
      t.string :contacts

      t.timestamps null: false
    end
  end
end
