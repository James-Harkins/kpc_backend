class CreateTripCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_courses do |t|
      t.references :trip, foreign_key: true
      t.references :course, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
