class CreateWagers < ActiveRecord::Migration[8.0]
  def change
    create_table :wagers do |t|
      t.float :amount
      t.string :type
      t.references :user, null: false, foreign_key: true
      t.references :horse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
