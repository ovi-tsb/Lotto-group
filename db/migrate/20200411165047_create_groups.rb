class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :shares
      t.integer :noofplays
      t.boolean :encore

      t.timestamps
    end
  end
end
