class CreateSix49WiningNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :six49_wining_numbers do |t|
      t.string :maxmil
      t.integer :numbers
      t.string :numero
      t.string :from
      t.string :maxmillion, array: true, default: []

      t.timestamps
    end
  end
end
