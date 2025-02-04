class CreateTestObj2s < ActiveRecord::Migration[8.0]
  def change
    create_table :test_obj_2s do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
