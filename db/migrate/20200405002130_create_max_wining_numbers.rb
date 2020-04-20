class CreateMaxWiningNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :max_wining_numbers do |t|
      t.integer :numbers

      t.timestamps
    end
  end
end
