class AddGameIdToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :game, foreign_key: true
  end
end
