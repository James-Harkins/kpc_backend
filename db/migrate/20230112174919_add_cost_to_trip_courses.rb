class AddCostToTripCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :trip_courses, :cost, :float
  end
end
