class AddMaxmilToMaxWiningNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :max_wining_numbers, :maxmil, :string
  end
end
