class AddNumarToMaxWiningNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :max_wining_numbers, :numar, :string, array: true, default: []
  end
end
