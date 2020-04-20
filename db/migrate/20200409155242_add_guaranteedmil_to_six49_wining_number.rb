class AddGuaranteedmilToSix49WiningNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :six49_wining_numbers, :guaranteedmil, :string
  end
end
