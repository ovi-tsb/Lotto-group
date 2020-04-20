class AddGameimageToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :gameimage, :string
  end
end
