class TripSerializer
  include JSONAPI::Serializer
  attributes :year, :number, :location

  attributes :nights do |trip|
    trip.nights.map do |night|
      {
        id: night.id,
        date: night.date,
        cost: night.cost
      }
    end
  end

  attributes :meals do |trip|
    trip.meals.map do |meal|
      {
        id: meal.id,
        date: meal.date,
        time_of_day: meal.time_of_day,
        cost: meal.cost
      }
    end
  end

  attributes :courses do |trip|
    trip.trip_courses.map do |tc|
      {
        id: tc.id,
        name: tc.course.name,
        date: tc.date,
        cost: tc.cost
      }
    end
  end


  attributes :golfers do |trip|
    trip.golfers.map do |golfer|
      {
        id: golfer.id,
        name: "#{golfer.first_name} #{golfer.last_name}",
        email: golfer.email,
        cost: golfer.trip_total_cost(trip.id)
      }
    end
  end
end
