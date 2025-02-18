class AddShowOddsToHorses < ActiveRecord::Migration[8.0]
  def change
    add_column :horses, :show_odds, :float
  end
end
