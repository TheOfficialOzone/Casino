# Creates Horse Database and populates it with horses
class CreateHorses < ActiveRecord::Migration[8.0]
  def change
    create_table :horses do |t|
      t.string :name
      t.float :speed
      t.string :image
      t.string :timing
      t.float :place_odds
      t.float :staright_odds

      t.timestamps
    end
  end
end
