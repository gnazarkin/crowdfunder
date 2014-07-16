class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :goal
      t.datetime :end_date
      t.string :category
      t.integer :funded_amount

      t.timestamps
    end
  end
end
