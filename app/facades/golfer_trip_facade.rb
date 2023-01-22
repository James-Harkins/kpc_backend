class GolferTripFacade
  def self.golfer_trip_data(params)
    response = Hash.new
    response[:golfer] = Golfer.find(params[:golfer_id])
    response[:trip] = Trip.find(params[:id])
    response[:nights] = golfer_trip_nights(response[:golfer], params[:id])
    response[:meals] = golfer_trip_meals(response[:golfer], params[:id])
    response[:courses] = golfer_trip_courses(response[:golfer], params[:id])
    response
  end

  def self.golfer_trips_data(params)
    golfer = Golfer.find(params[:golfer_id])
    golfer.trips.map do |trip|
      trip_params = Hash.new
      trip_params[:golfer_id] = golfer.id
      trip_params[:id] = trip.id
      golfer_trip_data(trip_params)
    end
  end

  def self.golfer_trip_nights(golfer, trip_id)
    golfer.nights.where(trip_id: trip_id)
  end

  def self.golfer_trip_meals(golfer, trip_id)
    golfer.meals.where(trip_id: trip_id)
  end

  def self.golfer_trip_courses(golfer, trip_id)
    golfer.golfer_trip_courses.joins(:trip_course)
    .where(trip_courses: {trip_id: trip_id})
  end

  def self.map_nights(trip_data)
    trip_data[:nights].map {|night| {id: night.id, date: night.date}}
  end

  def self.map_meals(trip_data)
    trip_data[:meals].map {|meal| {id: meal.id, date: meal.date, time_of_day: meal.time_of_day}}
  end

  def self.map_courses(trip_data)
    trip_data[:courses].map do |gtc|
      trip_course = TripCourse.find(gtc.trip_course_id)
      course = trip_course.course
      {
        course_id: course.id,
        trip_course_id: trip_course.id,
        date: trip_course.date,
        name: course.name,
        address: course.address,
        city: course.city,
        state: course.state,
        zip: course.zipcode
      }
    end
  end

  def self.trip_id(trip_data)
    trip_data[:trip].id
  end

  def self.trip_number(trip_data)
    trip_data[:trip].number
  end

  def self.trip_total_cost(trip_data)
    trip_data[:golfer].trip_total_cost(trip_data[:trip].id)
  end

  def self.create_new_golfer_trip(params)
    golfer = Golfer.find(params[:golfer_id])
    trip = Trip.find(params[:trip_id])
    golfer_trip = GolferTrip.create!(golfer: golfer, trip: trip)
    params[:nights].each {|night| golfer.golfer_nights.create!(night_id: night)}
    params[:meals].each {|meal| golfer.golfer_meals.create!(meal_id: meal)}
    params[:courses].each {|trip_course| golfer.golfer_trip_courses.create!(trip_course_id: trip_course)}
    golfer_trip_data({golfer_id: golfer.id, id: trip.id})
  end
end
