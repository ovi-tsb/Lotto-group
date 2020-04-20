class AddNumeroToMaxWiningNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :max_wining_numbers, :numero, :string
  end
end
