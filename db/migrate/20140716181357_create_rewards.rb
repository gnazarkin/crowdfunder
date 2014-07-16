class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.text :description
      t.integer :amount
      t.integer :project_id

      t.timestamps
    end
  end
end
