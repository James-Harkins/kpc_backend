class CreateGolferMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :golfer_meals do |t|
      t.references :meal, foreign_key: true
      t.references :golfer, foreign_key: true

      t.timestamps
    end
  end
end
