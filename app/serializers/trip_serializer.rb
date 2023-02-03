class TripSerializer
  include JSONAPI::Serializer
  attributes :year, :number, :location

  attributes :calendar do |trip|
    calendar = []
    trip.nights.each do |night|
      calendar_date = Hash.new
      calendar_date[night.date] = Hash.new 
      calendar_date[night.date][:night] = {id: night.id, cost: night.cost}
      calendar_date[night.date][:meals] = [] 
      trip.meals.where(date: night.date).each do |meal|
        meal = {
          id: meal.id,
          time_of_day: meal.time_of_day,
          cost: meal.cost
        }
        calendar_date[night.date][:meals] << meal
      end
      calendar_date[night.date][:course] = Hash.new 
      trip.trip_courses.where(date: night.date).each do |tc|
        calendar_date[night.date][:course][:id] = tc.id
        calendar_date[night.date][:course][:name] = tc.course.name
        calendar_date[night.date][:course][:cost] = tc.cost
      end
      calendar << calendar_date
    end
    last_meal = trip.meals.last 
    calendar_date = Hash.new
    calendar_date[last_meal.date] = Hash.new
    calendar_date[last_meal.date][:meals] = [{id: last_meal.id, time_of_day: last_meal.time_of_day, cost: last_meal.cost}]
    calendar << calendar_date
    calendar
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
