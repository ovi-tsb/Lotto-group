class AddUniqueIdentifierToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :unique_identifier, :string
  end
end
