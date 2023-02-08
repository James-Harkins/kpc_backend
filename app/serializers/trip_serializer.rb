class TripSerializer
  include JSONAPI::Serializer
  attributes :year, :number, :location, :start_date

  attributes :calendar do |trip|
    calendar = []
    trip.nights.each do |night|
      calendar_date = Hash.new
      calendar_date[:date] = night.date.strftime('%A %m-%d-%Y') 
      calendar_date[:night] = {
        id: night.id,  
        cost: night.cost
      }
      calendar_date[:meals] = [] 
      trip.meals.where(date: night.date).each do |meal|
        meal = {
          id: meal.id,
          time_of_day: meal.time_of_day,
          cost: meal.cost
        }
        calendar_date[:meals] << meal
      end
      calendar_date[:course] = Hash.new 
      trip.trip_courses.where(date: night.date).each do |tc|
        calendar_date[:course][:id] = tc.id
        calendar_date[:course][:name] = tc.course.name
        calendar_date[:course][:cost] = tc.cost
      end
      calendar << calendar_date
    end
    last_meal = trip.meals.last 
    calendar_date = Hash.new
    calendar_date[:date] = last_meal.date.strftime('%A %m-%d-%Y') 
    calendar_date[:night] = {}
    calendar_date[:meals] = [{id: last_meal.id, time_of_day: last_meal.time_of_day, cost: last_meal.cost}]
    calendar_date[:course] = {}
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
