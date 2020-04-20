class AddMaxmillionToMaxWiningNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :max_wining_numbers, :maxmillion, :string, array: true, default: []
  end
end
