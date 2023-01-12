class AddCostToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :cost, :float
  end
end
