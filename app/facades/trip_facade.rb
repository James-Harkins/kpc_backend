class TripFacade
  def self.create_trip_relationships(trip, params)
    create_trip_courses(trip, params)
    create_trip_nights(trip, params)
    create_trip_meals(trip, params)
  end

  def self.create_trip_courses(trip, params)
    params[:courses].each do |course|
      trip.trip_courses.create!(
        course_id: course[:course],
        date: course[:date],
        cost: course[:cost]
      )
    end
  end

  def self.create_trip_nights(trip, params)
    params[:nights].each do |night|
      trip.nights.create!(
        date: night[:date],
        cost: night[:cost]
      )
    end
  end

  def self.create_trip_meals(trip, params)
    params[:meals].each do |meal|
      trip.meals.create!(
        date: meal[:date],
        time_of_day: meal[:time_of_day],
        cost: meal[:cost]
      )
    end
  end
end
