class CreateGolferTripCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :golfer_trip_courses do |t|
      t.references :golfer, foreign_key: true
      t.references :trip_course, foreign_key: true

      t.timestamps
    end
  end
end
