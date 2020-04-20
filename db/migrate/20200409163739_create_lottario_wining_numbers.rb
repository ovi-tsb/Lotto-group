class CreateLottarioWiningNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :lottario_wining_numbers do |t|
      t.string :maxmil
      t.integer :numbers
      t.string :numero
      t.string :from
      t.string :maxmillion

      t.timestamps
    end
  end
end
