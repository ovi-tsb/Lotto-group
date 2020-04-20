class AddFromToMaxWiningNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :max_wining_numbers, :from, :string
  end
end
