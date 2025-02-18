class FixTypoInHorseModelAttribute < ActiveRecord::Migration[8.0]
  def change
	rename_column :horses, :staright_odds, :straight_odds
  end
end
