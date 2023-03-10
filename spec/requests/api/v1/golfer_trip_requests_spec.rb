require 'rails_helper'

describe 'golfer trip endpoints' do
  before do
    @golfer_1 = Golfer.create!(first_name: 'Tony', last_name: 'Soprano', email: 't@badabing.com', password: 'test123', password_confirmation: 'test123')
    @golfer_2 = Golfer.create!(first_name: 'Paulie', last_name: 'Gaultieri', email: 'walnuts@badabing.com', password: 'test123', password_confirmation: 'test123')

    @trip_1 = Trip.create!(year: 2013, number: 'XIII', location: 'Dewey Beach')
    @trip_2 = Trip.create!(year: 2014, number: 'XIV', location: 'Rehoboth Beach')
    @trip_3 = Trip.create!(year: 2015, number: 'XV', location: 'VA Beach')
    @trip_4 = Trip.create!(year: 2016, number: 'XVI', location: 'VA Beach')

    @night_1_trip_1 = @trip_1.nights.create!(date: Date.parse('2013-04-21'), cost: 0.0)
    @night_2_trip_1 = @trip_1.nights.create!(date: Date.parse('2013-04-22'), cost: 70.0)
    @night_3_trip_1 = @trip_1.nights.create!(date: Date.parse('2013-04-23'), cost: 70.0)
    @night_4_trip_1 = @trip_1.nights.create!(date: Date.parse('2013-04-24'), cost: 70.0)
    @night_5_trip_1 = @trip_1.nights.create!(date: Date.parse('2013-04-25'), cost: 70.0)
    @night_6_trip_1 = @trip_1.nights.create!(date: Date.parse('2013-04-26'), cost: 70.0)
    @night_7_trip_1 = @trip_1.nights.create!(date: Date.parse('2013-04-27'), cost: 70.0)

    @night_1_trip_2 = @trip_2.nights.create!(date: Date.parse('2014-04-20'), cost: 0.0)
    @night_2_trip_2 = @trip_2.nights.create!(date: Date.parse('2014-04-21'), cost: 80.0)
    @night_3_trip_2 = @trip_2.nights.create!(date: Date.parse('2014-04-22'), cost: 80.0)
    @night_4_trip_2 = @trip_2.nights.create!(date: Date.parse('2014-04-23'), cost: 80.0)
    @night_5_trip_2 = @trip_2.nights.create!(date: Date.parse('2014-04-24'), cost: 80.0)
    @night_6_trip_2 = @trip_2.nights.create!(date: Date.parse('2014-04-25'), cost: 80.0)
    @night_7_trip_2 = @trip_2.nights.create!(date: Date.parse('2014-04-26'), cost: 80.0)

    @night_1_trip_3 = @trip_3.nights.create!(date: Date.parse('2015-04-19'), cost: 0.0)
    @night_2_trip_3 = @trip_3.nights.create!(date: Date.parse('2015-04-20'), cost: 90.0)
    @night_3_trip_3 = @trip_3.nights.create!(date: Date.parse('2015-04-21'), cost: 90.0)
    @night_4_trip_3 = @trip_3.nights.create!(date: Date.parse('2015-04-22'), cost: 90.0)
    @night_5_trip_3 = @trip_3.nights.create!(date: Date.parse('2015-04-23'), cost: 90.0)
    @night_6_trip_3 = @trip_3.nights.create!(date: Date.parse('2015-04-24'), cost: 90.0)
    @night_7_trip_3 = @trip_3.nights.create!(date: Date.parse('2015-04-25'), cost: 90.0)

    @night_1_trip_4 = @trip_4.nights.create!(date: Date.parse('2016-04-24'), cost: 0.0)
    @night_2_trip_4 = @trip_4.nights.create!(date: Date.parse('2016-04-25'), cost: 100.0)
    @night_3_trip_4 = @trip_4.nights.create!(date: Date.parse('2016-04-26'), cost: 100.0)
    @night_4_trip_4 = @trip_4.nights.create!(date: Date.parse('2016-04-27'), cost: 100.0)
    @night_5_trip_4 = @trip_4.nights.create!(date: Date.parse('2016-04-28'), cost: 100.0)
    @night_6_trip_4 = @trip_4.nights.create!(date: Date.parse('2016-04-29'), cost: 100.0)
    @night_7_trip_4 = @trip_4.nights.create!(date: Date.parse('2016-04-30'), cost: 100.0)

    @meal_1_trip_1 = @trip_1.meals.create!(date: Date.parse('2013-04-22'), time_of_day: 0, cost: 5.0)
    @meal_2_trip_1 = @trip_1.meals.create!(date: Date.parse('2013-04-22'), time_of_day: 1, cost: 5.0)
    @meal_3_trip_1 = @trip_1.meals.create!(date: Date.parse('2013-04-23'), time_of_day: 0, cost: 5.0)
    @meal_4_trip_1 = @trip_1.meals.create!(date: Date.parse('2013-04-23'), time_of_day: 1, cost: 5.0)
    @meal_5_trip_1 = @trip_1.meals.create!(date: Date.parse('2013-04-24'), time_of_day: 0, cost: 5.0)
    @meal_6_trip_1 = @trip_1.meals.create!(date: Date.parse('2013-04-24'), time_of_day: 1, cost: 5.0)
    @meal_7_trip_1 = @trip_1.meals.create!(date: Date.parse('2013-04-25'), time_of_day: 0, cost: 5.0)
    @meal_8_trip_1 = @trip_1.meals.create!(date: Date.parse('2013-04-25'), time_of_day: 1, cost: 5.0)
    @meal_9_trip_1 = @trip_1.meals.create!(date: Date.parse('2013-04-26'), time_of_day: 0, cost: 5.0)
    @meal_10_trip_1 = @trip_1.meals.create!(date: Date.parse('2013-04-26'), time_of_day: 1, cost: 5.0)
    @meal_11_trip_1 = @trip_1.meals.create!(date: Date.parse('2013-04-27'), time_of_day: 0, cost: 5.0)
    @meal_12_trip_1 = @trip_1.meals.create!(date: Date.parse('2013-04-27'), time_of_day: 1, cost: 5.0)
    @meal_13_trip_1 = @trip_1.meals.create!(date: Date.parse('2013-04-28'), time_of_day: 0, cost: 5.0)

    @meal_1_trip_2 = @trip_2.meals.create!(date: Date.parse('2014-04-21'), time_of_day: 0, cost: 5.0)
    @meal_2_trip_2 = @trip_2.meals.create!(date: Date.parse('2014-04-21'), time_of_day: 1, cost: 5.0)
    @meal_3_trip_2 = @trip_2.meals.create!(date: Date.parse('2014-04-22'), time_of_day: 0, cost: 5.0)
    @meal_4_trip_2 = @trip_2.meals.create!(date: Date.parse('2014-04-22'), time_of_day: 1, cost: 5.0)
    @meal_5_trip_2 = @trip_2.meals.create!(date: Date.parse('2014-04-23'), time_of_day: 0, cost: 5.0)
    @meal_6_trip_2 = @trip_2.meals.create!(date: Date.parse('2014-04-23'), time_of_day: 1, cost: 5.0)
    @meal_7_trip_2 = @trip_2.meals.create!(date: Date.parse('2014-04-24'), time_of_day: 0, cost: 5.0)
    @meal_8_trip_2 = @trip_2.meals.create!(date: Date.parse('2014-04-24'), time_of_day: 1, cost: 5.0)
    @meal_9_trip_2 = @trip_2.meals.create!(date: Date.parse('2014-04-25'), time_of_day: 0, cost: 5.0)
    @meal_10_trip_2 = @trip_2.meals.create!(date: Date.parse('2014-04-25'), time_of_day: 1, cost: 5.0)
    @meal_11_trip_2 = @trip_2.meals.create!(date: Date.parse('2014-04-26'), time_of_day: 0, cost: 5.0)
    @meal_12_trip_2 = @trip_2.meals.create!(date: Date.parse('2014-04-26'), time_of_day: 1, cost: 5.0)
    @meal_13_trip_2 = @trip_2.meals.create!(date: Date.parse('2014-04-27'), time_of_day: 0, cost: 5.0)

    @meal_1_trip_3 = @trip_3.meals.create!(date: Date.parse('2015-04-20'), time_of_day: 0, cost: 5.0)
    @meal_2_trip_3 = @trip_3.meals.create!(date: Date.parse('2015-04-20'), time_of_day: 1, cost: 5.0)
    @meal_3_trip_3 = @trip_3.meals.create!(date: Date.parse('2015-04-21'), time_of_day: 0, cost: 5.0)
    @meal_4_trip_3 = @trip_3.meals.create!(date: Date.parse('2015-04-21'), time_of_day: 1, cost: 5.0)
    @meal_5_trip_3 = @trip_3.meals.create!(date: Date.parse('2015-04-22'), time_of_day: 0, cost: 5.0)
    @meal_6_trip_3 = @trip_3.meals.create!(date: Date.parse('2015-04-22'), time_of_day: 1, cost: 5.0)
    @meal_7_trip_3 = @trip_3.meals.create!(date: Date.parse('2015-04-23'), time_of_day: 0, cost: 5.0)
    @meal_8_trip_3 = @trip_3.meals.create!(date: Date.parse('2015-04-23'), time_of_day: 1, cost: 5.0)
    @meal_9_trip_3 = @trip_3.meals.create!(date: Date.parse('2015-04-24'), time_of_day: 0, cost: 5.0)
    @meal_10_trip_3 = @trip_3.meals.create!(date: Date.parse('2015-04-24'), time_of_day: 1, cost: 5.0)
    @meal_11_trip_3 = @trip_3.meals.create!(date: Date.parse('2015-04-25'), time_of_day: 0, cost: 5.0)
    @meal_12_trip_3 = @trip_3.meals.create!(date: Date.parse('2015-04-25'), time_of_day: 1, cost: 5.0)
    @meal_13_trip_3 = @trip_3.meals.create!(date: Date.parse('2015-04-26'), time_of_day: 0, cost: 5.0)

    @meal_1_trip_4 = @trip_4.meals.create!(date: Date.parse('2016-04-25'), time_of_day: 0, cost: 5.0)
    @meal_2_trip_4 = @trip_4.meals.create!(date: Date.parse('2016-04-25'), time_of_day: 1, cost: 5.0)
    @meal_3_trip_4 = @trip_4.meals.create!(date: Date.parse('2016-04-26'), time_of_day: 0, cost: 5.0)
    @meal_4_trip_4 = @trip_4.meals.create!(date: Date.parse('2016-04-26'), time_of_day: 1, cost: 5.0)
    @meal_5_trip_4 = @trip_4.meals.create!(date: Date.parse('2016-04-27'), time_of_day: 0, cost: 5.0)
    @meal_6_trip_4 = @trip_4.meals.create!(date: Date.parse('2016-04-27'), time_of_day: 1, cost: 5.0)
    @meal_7_trip_4 = @trip_4.meals.create!(date: Date.parse('2016-04-28'), time_of_day: 0, cost: 5.0)
    @meal_8_trip_4 = @trip_4.meals.create!(date: Date.parse('2016-04-28'), time_of_day: 1, cost: 5.0)
    @meal_9_trip_4 = @trip_4.meals.create!(date: Date.parse('2016-04-29'), time_of_day: 0, cost: 5.0)
    @meal_10_trip_4 = @trip_4.meals.create!(date: Date.parse('2016-04-29'), time_of_day: 1, cost: 5.0)
    @meal_11_trip_4 = @trip_4.meals.create!(date: Date.parse('2016-04-30'), time_of_day: 0, cost: 5.0)
    @meal_12_trip_4 = @trip_4.meals.create!(date: Date.parse('2016-04-30'), time_of_day: 1, cost: 5.0)
    @meal_13_trip_4 = @trip_4.meals.create!(date: Date.parse('2016-05-01'), time_of_day: 0, cost: 5.0)

    @course_1 = Course.create!(name: 'Kings Creek Country Club', address: '1 Kings Creek Cir', city: 'Rehoboth Beach', state: 'DE', zipcode: '19971')
    @course_2 = Course.create!(name: 'Rehoboth Country Club', address: '221 West Side Dr', city: 'Rehoboth Beach', state: 'DE', zipcode: '19971')
    @course_3 = Course.create!(name: 'The Salt Pond Golf Club', address: '402 Bethany Loop', city: 'Bethany Beach', state: 'DE', zipcode: '19930')
    @course_4 = Course.create!(name: 'American Classic Golf Club', address: '18485 Bethpage Dr', city: 'Lewes', state: 'DE', zipcode: '19958')
    @course_5 = Course.create!(name: 'Red Wing Lake Golf Course', address: '1144 Prosperity Rd', city: 'Virginia Beach', state: 'VA', zipcode: '23451')
    @course_6 = Course.create!(name: 'Virginia Beach National Golf Club', address: '2500 Tournament Dr', city: 'Virginia Beach', state: 'VA', zipcode: '23456')
    @course_7 = Course.create!(name: 'Hells Point Golf Club', address: '2700 Atwoodtown Rd', city: 'Virginia Beach', state: 'VA', zipcode: '23456')
    @course_8 = Course.create!(name: 'Heron Ridge Golf Club', address: '2973 Heron Ridge Dr', city: 'Virginia Beach', state: 'VA', zipcode: '23456')
    @course_9 = Course.create!(name: 'Stumpy Lake Golf Course', address: '4797 Indian River Rd', city: 'Virginia Beach', state: 'VA', zipcode: '23456')

    @trip_1_course_1 = @trip_1.trip_courses.create!(course: @course_1, date: Date.parse('2013-04-22'), cost: 65)
    @trip_1_course_2 = @trip_1.trip_courses.create!(course: @course_2, date: Date.parse('2013-04-23'), cost: 65)
    @trip_1_course_3 = @trip_1.trip_courses.create!(course: @course_3, date: Date.parse('2013-04-24'), cost: 65)
    @trip_1_course_4 = @trip_1.trip_courses.create!(course: @course_4, date: Date.parse('2013-04-25'), cost: 65)
    @trip_1_course_5 = @trip_1.trip_courses.create!(course: @course_1, date: Date.parse('2013-04-26'), cost: 65)
    @trip_1_course_6 = @trip_1.trip_courses.create!(course: @course_2, date: Date.parse('2013-04-27'), cost: 65)

    @trip_2_course_1 = @trip_2.trip_courses.create!(course: @course_1, date: Date.parse('2014-04-21'), cost: 70)
    @trip_2_course_2 = @trip_2.trip_courses.create!(course: @course_2, date: Date.parse('2014-04-22'), cost: 70)
    @trip_2_course_3 = @trip_2.trip_courses.create!(course: @course_3, date: Date.parse('2014-04-23'), cost: 70)
    @trip_2_course_4 = @trip_2.trip_courses.create!(course: @course_4, date: Date.parse('2014-04-24'), cost: 70)
    @trip_2_course_5 = @trip_2.trip_courses.create!(course: @course_1, date: Date.parse('2014-04-25'), cost: 70)
    @trip_2_course_6 = @trip_2.trip_courses.create!(course: @course_3, date: Date.parse('2014-04-26'), cost: 70)

    @trip_3_course_2 = @trip_3.trip_courses.create!(course: @course_5, date: Date.parse('2015-04-20'), cost: 50)
    @trip_3_course_1 = @trip_3.trip_courses.create!(course: @course_6, date: Date.parse('2015-04-21'), cost: 50)
    @trip_3_course_3 = @trip_3.trip_courses.create!(course: @course_7, date: Date.parse('2015-04-22'), cost: 50)
    @trip_3_course_4 = @trip_3.trip_courses.create!(course: @course_8, date: Date.parse('2015-04-23'), cost: 50)
    @trip_3_course_5 = @trip_3.trip_courses.create!(course: @course_9, date: Date.parse('2015-04-24'), cost: 50)
    @trip_3_course_6 = @trip_3.trip_courses.create!(course: @course_6, date: Date.parse('2015-04-25'), cost: 50)

    @trip_4_course_1 = @trip_4.trip_courses.create!(course: @course_5, date: Date.parse('2016-04-25'), cost: 60)
    @trip_4_course_2 = @trip_4.trip_courses.create!(course: @course_6, date: Date.parse('2016-04-26'), cost: 60)
    @trip_4_course_3 = @trip_4.trip_courses.create!(course: @course_7, date: Date.parse('2016-04-27'), cost: 60)
    @trip_4_course_4 = @trip_4.trip_courses.create!(course: @course_8, date: Date.parse('2016-04-28'), cost: 60)
    @trip_4_course_5 = @trip_4.trip_courses.create!(course: @course_9, date: Date.parse('2016-04-29'), cost: 60)
    @trip_4_course_6 = @trip_4.trip_courses.create!(course: @course_5, date: Date.parse('2016-04-30'), cost: 60)

    @golfer_1_trip_1 = @golfer_1.golfer_trips.create!(trip: @trip_1)
    @golfer_1_trip_1_meal_1 = @golfer_1.golfer_meals.create!(meal: @meal_4_trip_1)
    @golfer_1_trip_1_night_1 = @golfer_1.golfer_nights.create!(night: @night_3_trip_1)
    @golfer_1_trip_1_meal_2 = @golfer_1.golfer_meals.create!(meal: @meal_5_trip_1)
    @golfer_1_trip_1_golfer_trip_course_1 = @golfer_1.golfer_trip_courses.create!(trip_course: @trip_1_course_3)
    @golfer_1_trip_1_meal_3 = @golfer_1.golfer_meals.create!(meal: @meal_6_trip_1)
    @golfer_1_trip_1_night_2 = @golfer_1.golfer_nights.create!(night: @night_4_trip_1)
    @golfer_1_trip_1_meal_4 = @golfer_1.golfer_meals.create!(meal: @meal_7_trip_1)
    @golfer_1_trip_1_golfer_trip_course_2 = @golfer_1.golfer_trip_courses.create!(trip_course: @trip_1_course_4)
    @golfer_1_trip_1_meal_5 = @golfer_1.golfer_meals.create!(meal: @meal_8_trip_1)
    @golfer_1_trip_1_night_3 = @golfer_1.golfer_nights.create!(night: @night_5_trip_1)
    @golfer_1_trip_1_meal_6 = @golfer_1.golfer_meals.create!(meal: @meal_9_trip_1)
    @golfer_1_trip_1_golfer_trip_course_3 = @golfer_1.golfer_trip_courses.create!(trip_course: @trip_1_course_5)
    @golfer_1_trip_1_meal_7 = @golfer_1.golfer_meals.create!(meal: @meal_10_trip_1)
    @golfer_1_trip_1_night_4 = @golfer_1.golfer_nights.create!(night: @night_6_trip_1)
    @golfer_1_trip_1_meal_8 = @golfer_1.golfer_meals.create!(meal: @meal_11_trip_1)
    @golfer_1_trip_1_golfer_trip_course_4 = @golfer_1.golfer_trip_courses.create!(trip_course: @trip_1_course_6)
    @golfer_1_trip_1_meal_9 = @golfer_1.golfer_meals.create!(meal: @meal_12_trip_1)
    @golfer_1_trip_1_night_5 = @golfer_1.golfer_nights.create!(night: @night_7_trip_1)
    @golfer_1_trip_1_meal_10 = @golfer_1.golfer_meals.create!(meal: @meal_13_trip_1)

    @golfer_1_trip_2 = @golfer_1.golfer_trips.create!(trip: @trip_2)
    @golfer_1_trip_2_meal_1 = @golfer_1.golfer_meals.create!(meal: @meal_6_trip_2)
    @golfer_1_trip_2_night_1 = @golfer_1.golfer_nights.create!(night: @night_4_trip_2)
    @golfer_1_trip_2_meal_2 = @golfer_1.golfer_meals.create!(meal: @meal_7_trip_2)
    @golfer_1_trip_2_golfer_trip_course_1 = @golfer_1.golfer_trip_courses.create!(trip_course: @trip_2_course_4)
    @golfer_1_trip_2_meal_3 = @golfer_1.golfer_meals.create!(meal: @meal_8_trip_2)
    @golfer_1_trip_2_night_2 = @golfer_1.golfer_nights.create!(night: @night_5_trip_2)
    @golfer_1_trip_2_meal_4 = @golfer_1.golfer_meals.create!(meal: @meal_9_trip_2)
    @golfer_1_trip_2_golfer_trip_course_2 = @golfer_1.golfer_trip_courses.create!(trip_course: @trip_2_course_5)
    @golfer_1_trip_2_meal_5 = @golfer_1.golfer_meals.create!(meal: @meal_10_trip_2)
    @golfer_1_trip_2_night_3 = @golfer_1.golfer_nights.create!(night: @night_6_trip_2)
    @golfer_1_trip_2_meal_6 = @golfer_1.golfer_meals.create!(meal: @meal_11_trip_2)
    @golfer_1_trip_2_golfer_trip_course_3 = @golfer_1.golfer_trip_courses.create!(trip_course: @trip_2_course_6)
    @golfer_1_trip_2_meal_7 = @golfer_1.golfer_meals.create!(meal: @meal_12_trip_2)
    @golfer_1_trip_2_night_4 = @golfer_1.golfer_nights.create!(night: @night_7_trip_2)
    @golfer_1_trip_2_meal_8 = @golfer_1.golfer_meals.create!(meal: @meal_13_trip_2)

    @golfer_1_trip_3 = @golfer_1.golfer_trips.create!(trip: @trip_4)
    @golfer_1_trip_3_night_1 = @golfer_1.golfer_nights.create!(night: @night_1_trip_4)
    @golfer_1_trip_3_meal_1 = @golfer_1.golfer_meals.create!(meal: @meal_1_trip_4)
    @golfer_1_trip_3_golfer_trip_course_1 = @golfer_1.golfer_trip_courses.create!(trip_course: @trip_4_course_1)
    @golfer_1_trip_3_meal_2 = @golfer_1.golfer_meals.create!(meal: @meal_2_trip_4)
    @golfer_1_trip_3_night_2 = @golfer_1.golfer_nights.create!(night: @night_2_trip_4)
    @golfer_1_trip_3_meal_3 = @golfer_1.golfer_meals.create!(meal: @meal_3_trip_4)
    @golfer_1_trip_3_golfer_trip_course_2 = @golfer_1.golfer_trip_courses.create!(trip_course: @trip_4_course_2)
    @golfer_1_trip_3_meal_4 = @golfer_1.golfer_meals.create!(meal: @meal_4_trip_4)
    @golfer_1_trip_3_night_3 = @golfer_1.golfer_nights.create!(night: @night_3_trip_4)
    @golfer_1_trip_3_meal_5 = @golfer_1.golfer_meals.create!(meal: @meal_5_trip_4)
    @golfer_1_trip_3_golfer_trip_course_3 = @golfer_1.golfer_trip_courses.create!(trip_course: @trip_4_course_3)
    @golfer_1_trip_3_meal_6 = @golfer_1.golfer_meals.create!(meal: @meal_6_trip_4)
    @golfer_1_trip_3_night_4 = @golfer_1.golfer_nights.create!(night: @night_4_trip_4)
    @golfer_1_trip_3_meal_7 = @golfer_1.golfer_meals.create!(meal: @meal_7_trip_4)
    @golfer_1_trip_3_golfer_trip_course_4 = @golfer_1.golfer_trip_courses.create!(trip_course: @trip_4_course_4)
    @golfer_1_trip_3_meal_8 = @golfer_1.golfer_meals.create!(meal: @meal_8_trip_4)
    @golfer_1_trip_3_night_5 = @golfer_1.golfer_nights.create!(night: @night_5_trip_4)
    @golfer_1_trip_3_meal_9 = @golfer_1.golfer_meals.create!(meal: @meal_9_trip_4)
    @golfer_1_trip_3_golfer_trip_course_5 = @golfer_1.golfer_trip_courses.create!(trip_course: @trip_4_course_5)
    @golfer_1_trip_3_meal_10 = @golfer_1.golfer_meals.create!(meal: @meal_10_trip_4)
    @golfer_1_trip_3_night_6 = @golfer_1.golfer_nights.create!(night: @night_6_trip_4)
    @golfer_1_trip_3_meal_11 = @golfer_1.golfer_meals.create!(meal: @meal_11_trip_4)
    @golfer_1_trip_3_golfer_trip_course_6 = @golfer_1.golfer_trip_courses.create!(trip_course: @trip_4_course_6)
    @golfer_1_trip_3_meal_12 = @golfer_1.golfer_meals.create!(meal: @meal_12_trip_4)
    @golfer_1_trip_3_night_7 = @golfer_1.golfer_nights.create!(night: @night_7_trip_4)
    @golfer_1_trip_3_meal_13 = @golfer_1.golfer_meals.create!(meal: @meal_13_trip_4)

    @golfer_2_trip_1 = @golfer_2.golfer_trips.create!(trip: @trip_1)
    @golfer_2_trip_1_night_1 = @golfer_2.golfer_nights.create!(night: @night_5_trip_1)
    @golfer_2_trip_1_meal_1 = @golfer_2.golfer_meals.create!(meal: @meal_9_trip_1)
    @golfer_2_trip_1_golfer_trip_course_1 = @golfer_2.golfer_trip_courses.create!(trip_course: @trip_1_course_5)
    @golfer_2_trip_1_meal_2 = @golfer_2.golfer_meals.create!(meal: @meal_10_trip_1)
    @golfer_2_trip_1_night_2 = @golfer_2.golfer_nights.create!(night: @night_6_trip_1)
    @golfer_2_trip_1_meal_3 = @golfer_2.golfer_meals.create!(meal: @meal_11_trip_1)
    @golfer_2_trip_1_golfer_trip_course_2 = @golfer_2.golfer_trip_courses.create!(trip_course: @trip_1_course_6)
    @golfer_2_trip_1_meal_4 = @golfer_2.golfer_meals.create!(meal: @meal_12_trip_1)
    @golfer_2_trip_1_night_3 = @golfer_2.golfer_nights.create!(night: @night_7_trip_1)
    @golfer_2_trip_1_meal_5 = @golfer_2.golfer_meals.create!(meal: @meal_13_trip_1)

    @golfer_2_trip_2 = @golfer_2.golfer_trips.create!(trip: @trip_3)
    @golfer_2_trip_2_night_1 = @golfer_2.golfer_nights.create!(night: @night_5_trip_3)
    @golfer_2_trip_2_meal_1 = @golfer_2.golfer_meals.create!(meal: @meal_9_trip_3)
    @golfer_2_trip_2_golfer_trip_course_1 = @golfer_2.golfer_trip_courses.create!(trip_course: @trip_3_course_5)
    @golfer_2_trip_2_meal_2 = @golfer_2.golfer_meals.create!(meal: @meal_10_trip_3)
    @golfer_2_trip_2_night_2 = @golfer_2.golfer_nights.create!(night: @night_6_trip_3)
    @golfer_2_trip_2_meal_3 = @golfer_2.golfer_meals.create!(meal: @meal_11_trip_3)
    @golfer_2_trip_2_golfer_trip_course_2 = @golfer_2.golfer_trip_courses.create!(trip_course: @trip_3_course_6)
    @golfer_2_trip_2_meal_4 = @golfer_2.golfer_meals.create!(meal: @meal_12_trip_3)
    @golfer_2_trip_2_night_3 = @golfer_2.golfer_nights.create!(night: @night_7_trip_3)
    @golfer_2_trip_2_meal_5 = @golfer_2.golfer_meals.create!(meal: @meal_13_trip_3)
  end

  describe 'GET /golfers/:golfer_id/golfer_trips/:trip_id request' do
    describe 'happy path' do
      it 'returns some golfers trip data for a specific trip' do
        get "/api/v1/golfers/#{@golfer_1.id}/golfer_trips/#{@trip_4.id}?api_key=#{ENV["API_KEY"]}"

        expect(response).to have_http_status(200)

        response_body = JSON.parse(response.body, symbolize_names: true)
        trip = response_body[:data]

        expect(trip).to be_a Hash
        expect(trip[:id]).to eq(@trip_4.id)
        expect(trip[:type]).to eq('golfer_trip')
        expect(trip[:trip_number]).to eq('XVI')
        expect(trip[:total_cost]).to eq(1025.0)
        expect(trip[:attributes]).to be_a Hash
        expect(trip[:attributes].keys).to eq([:nights, :meals, :courses])
        expect(trip[:attributes][:nights]).to be_an Array
        expect(trip[:attributes][:nights].length).to eq(7)
        expect(trip[:attributes][:nights][0]).to be_a Hash
        expect(trip[:attributes][:nights][0][:id]).to eq(@night_1_trip_4.id)
        expect(trip[:attributes][:nights][0][:date]).to eq(@night_1_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:nights][1][:id]).to eq(@night_2_trip_4.id)
        expect(trip[:attributes][:nights][1][:date]).to eq(@night_2_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:nights][2][:id]).to eq(@night_3_trip_4.id)
        expect(trip[:attributes][:nights][2][:date]).to eq(@night_3_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:nights][3][:id]).to eq(@night_4_trip_4.id)
        expect(trip[:attributes][:nights][3][:date]).to eq(@night_4_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:nights][4][:id]).to eq(@night_5_trip_4.id)
        expect(trip[:attributes][:nights][4][:date]).to eq(@night_5_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:nights][5][:id]).to eq(@night_6_trip_4.id)
        expect(trip[:attributes][:nights][5][:date]).to eq(@night_6_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:nights][6][:id]).to eq(@night_7_trip_4.id)
        expect(trip[:attributes][:nights][6][:date]).to eq(@night_7_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:courses]).to be_an Array
        expect(trip[:attributes][:courses].length).to eq(6)
        expect(trip[:attributes][:courses][0]).to be_a Hash
        expect(trip[:attributes][:courses][0][:course_id]).to eq(@course_5.id)
        expect(trip[:attributes][:courses][0][:trip_course_id]).to eq(@trip_4_course_1.id)
        expect(trip[:attributes][:courses][0][:date]).to eq(@trip_4_course_1.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:courses][0][:name]).to eq(@trip_4_course_1.course.name)
        expect(trip[:attributes][:courses][0][:address]).to eq(@trip_4_course_1.course.address)
        expect(trip[:attributes][:courses][0][:city]).to eq(@trip_4_course_1.course.city)
        expect(trip[:attributes][:courses][0][:state]).to eq(@trip_4_course_1.course.state)
        expect(trip[:attributes][:courses][0][:zip]).to eq(@trip_4_course_1.course.zipcode)
        expect(trip[:attributes][:courses][1][:name]).to eq(@trip_4_course_2.course.name)
        expect(trip[:attributes][:courses][2][:name]).to eq(@trip_4_course_3.course.name)
        expect(trip[:attributes][:courses][3][:name]).to eq(@trip_4_course_4.course.name)
        expect(trip[:attributes][:courses][4][:name]).to eq(@trip_4_course_5.course.name)
        expect(trip[:attributes][:courses][5][:name]).to eq(@trip_4_course_6.course.name)
        expect(trip[:attributes][:meals]).to be_an Array
        expect(trip[:attributes][:meals].length).to eq(13)
        expect(trip[:attributes][:meals][0]).to be_a Hash
        expect(trip[:attributes][:meals][0][:id]).to eq(@meal_1_trip_4.id)
        expect(trip[:attributes][:meals][0][:date]).to eq(@meal_1_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][0][:time_of_day]).to eq('Breakfast')
        expect(trip[:attributes][:meals][1][:id]).to eq(@meal_2_trip_4.id)
        expect(trip[:attributes][:meals][1][:date]).to eq(@meal_2_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][1][:time_of_day]).to eq('Dinner')
        expect(trip[:attributes][:meals][2][:id]).to eq(@meal_3_trip_4.id)
        expect(trip[:attributes][:meals][2][:date]).to eq(@meal_3_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][2][:time_of_day]).to eq('Breakfast')
        expect(trip[:attributes][:meals][3][:id]).to eq(@meal_4_trip_4.id)
        expect(trip[:attributes][:meals][3][:date]).to eq(@meal_4_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][3][:time_of_day]).to eq('Dinner')
        expect(trip[:attributes][:meals][4][:id]).to eq(@meal_5_trip_4.id)
        expect(trip[:attributes][:meals][4][:date]).to eq(@meal_5_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][4][:time_of_day]).to eq('Breakfast')
        expect(trip[:attributes][:meals][5][:id]).to eq(@meal_6_trip_4.id)
        expect(trip[:attributes][:meals][5][:date]).to eq(@meal_6_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][5][:time_of_day]).to eq('Dinner')
        expect(trip[:attributes][:meals][6][:id]).to eq(@meal_7_trip_4.id)
        expect(trip[:attributes][:meals][6][:date]).to eq(@meal_7_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][6][:time_of_day]).to eq('Breakfast')
        expect(trip[:attributes][:meals][7][:id]).to eq(@meal_8_trip_4.id)
        expect(trip[:attributes][:meals][7][:date]).to eq(@meal_8_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][7][:time_of_day]).to eq('Dinner')
        expect(trip[:attributes][:meals][8][:id]).to eq(@meal_9_trip_4.id)
        expect(trip[:attributes][:meals][8][:date]).to eq(@meal_9_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][8][:time_of_day]).to eq('Breakfast')
        expect(trip[:attributes][:meals][9][:id]).to eq(@meal_10_trip_4.id)
        expect(trip[:attributes][:meals][9][:date]).to eq(@meal_10_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][9][:time_of_day]).to eq('Dinner')
        expect(trip[:attributes][:meals][10][:id]).to eq(@meal_11_trip_4.id)
        expect(trip[:attributes][:meals][10][:date]).to eq(@meal_11_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][10][:time_of_day]).to eq('Breakfast')
        expect(trip[:attributes][:meals][11][:id]).to eq(@meal_12_trip_4.id)
        expect(trip[:attributes][:meals][11][:date]).to eq(@meal_12_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][11][:time_of_day]).to eq('Dinner')
        expect(trip[:attributes][:meals][12][:id]).to eq(@meal_13_trip_4.id)
        expect(trip[:attributes][:meals][12][:date]).to eq(@meal_13_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][12][:time_of_day]).to eq('Breakfast')
      end
    end
  end

  describe 'GET /golfers/:golfer_id/golfer_trips request' do
    describe 'happy path' do
      it 'returns all of some golfers trips, along with each trips nights,
          meals, courses, and total cost for each trip' do
        get "/api/v1/golfers/#{@golfer_1.id}/golfer_trips?api_key=#{ENV["API_KEY"]}"

        expect(response).to have_http_status(200)

        response_body = JSON.parse(response.body, symbolize_names: true)
        trips = response_body[:data]

        expect(trips).to be_an Array
        expect(trips.length).to eq(3)
        expect(trips[0]).to be_a Hash
        expect(trips[0][:id]).to eq(@trip_1.id)
        expect(trips[0][:type]).to eq('golfer_trip')
        expect(trips[0][:trip_number]).to eq('XIII')
        expect(trips[0][:total_cost]).to eq(660.0)
        expect(trips[0][:attributes]).to be_a Hash
        expect(trips[0][:attributes].keys).to eq([:nights, :meals, :courses])
        expect(trips[0][:attributes][:nights]).to be_an Array
        expect(trips[0][:attributes][:nights].length).to eq(5)
        expect(trips[0][:attributes][:nights][0]).to be_a Hash
        expect(trips[0][:attributes][:nights][0][:date]).to eq(@night_3_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:nights][1][:date]).to eq(@night_4_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:nights][2][:date]).to eq(@night_5_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:nights][3][:date]).to eq(@night_6_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:nights][4][:date]).to eq(@night_7_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:courses]).to be_an Array
        expect(trips[0][:attributes][:courses].length).to eq(4)
        expect(trips[0][:attributes][:courses][0]).to be_a Hash
        expect(trips[0][:attributes][:courses][0][:name]).to eq(@trip_1_course_3.course.name)
        expect(trips[0][:attributes][:courses][1][:name]).to eq(@trip_1_course_4.course.name)
        expect(trips[0][:attributes][:courses][2][:name]).to eq(@trip_1_course_5.course.name)
        expect(trips[0][:attributes][:courses][3][:name]).to eq(@trip_1_course_6.course.name)
        expect(trips[0][:attributes][:meals]).to be_an Array
        expect(trips[0][:attributes][:meals].length).to eq(10)
        expect(trips[0][:attributes][:meals][0]).to be_a Hash
        expect(trips[0][:attributes][:meals][0][:date]).to eq(@meal_4_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:meals][1][:date]).to eq(@meal_5_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:meals][2][:date]).to eq(@meal_6_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:meals][3][:date]).to eq(@meal_7_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:meals][4][:date]).to eq(@meal_8_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:meals][5][:date]).to eq(@meal_9_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:meals][6][:date]).to eq(@meal_10_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:meals][7][:date]).to eq(@meal_11_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:meals][8][:date]).to eq(@meal_12_trip_1.date.strftime('%Y-%m-%d'))
        expect(trips[0][:attributes][:meals][9][:date]).to eq(@meal_13_trip_1.date.strftime('%Y-%m-%d'))

        expect(trips[1]).to be_a Hash
        expect(trips[1][:id]).to eq(@trip_2.id)
        expect(trips[1][:type]).to eq('golfer_trip')
        expect(trips[1][:trip_number]).to eq('XIV')
        expect(trips[1][:total_cost]).to eq(570.0)
        expect(trips[1][:attributes]).to be_a Hash
        expect(trips[1][:attributes].keys).to eq([:nights, :meals, :courses])
        expect(trips[1][:attributes][:nights]).to be_an Array
        expect(trips[1][:attributes][:nights].length).to eq(4)
        expect(trips[1][:attributes][:nights][0]).to be_a Hash
        expect(trips[1][:attributes][:nights][0][:date]).to eq(@night_4_trip_2.date.strftime('%Y-%m-%d'))
        expect(trips[1][:attributes][:nights][1][:date]).to eq(@night_5_trip_2.date.strftime('%Y-%m-%d'))
        expect(trips[1][:attributes][:nights][2][:date]).to eq(@night_6_trip_2.date.strftime('%Y-%m-%d'))
        expect(trips[1][:attributes][:nights][3][:date]).to eq(@night_7_trip_2.date.strftime('%Y-%m-%d'))
        expect(trips[1][:attributes][:courses]).to be_an Array
        expect(trips[1][:attributes][:courses].length).to eq(3)
        expect(trips[1][:attributes][:courses][0]).to be_a Hash
        expect(trips[1][:attributes][:courses][0][:name]).to eq(@trip_2_course_4.course.name)
        expect(trips[1][:attributes][:courses][1][:name]).to eq(@trip_2_course_5.course.name)
        expect(trips[1][:attributes][:courses][2][:name]).to eq(@trip_2_course_6.course.name)
        expect(trips[1][:attributes][:meals]).to be_an Array
        expect(trips[1][:attributes][:meals].length).to eq(8)
        expect(trips[1][:attributes][:meals][0]).to be_a Hash
        expect(trips[1][:attributes][:meals][0][:date]).to eq(@meal_6_trip_2.date.strftime('%Y-%m-%d'))
        expect(trips[1][:attributes][:meals][1][:date]).to eq(@meal_7_trip_2.date.strftime('%Y-%m-%d'))
        expect(trips[1][:attributes][:meals][2][:date]).to eq(@meal_8_trip_2.date.strftime('%Y-%m-%d'))
        expect(trips[1][:attributes][:meals][3][:date]).to eq(@meal_9_trip_2.date.strftime('%Y-%m-%d'))
        expect(trips[1][:attributes][:meals][4][:date]).to eq(@meal_10_trip_2.date.strftime('%Y-%m-%d'))
        expect(trips[1][:attributes][:meals][5][:date]).to eq(@meal_11_trip_2.date.strftime('%Y-%m-%d'))
        expect(trips[1][:attributes][:meals][6][:date]).to eq(@meal_12_trip_2.date.strftime('%Y-%m-%d'))
        expect(trips[1][:attributes][:meals][7][:date]).to eq(@meal_13_trip_2.date.strftime('%Y-%m-%d'))

        expect(trips[2]).to be_a Hash
        expect(trips[2][:id]).to eq(@trip_4.id)
        expect(trips[2][:type]).to eq('golfer_trip')
        expect(trips[2][:trip_number]).to eq('XVI')
        expect(trips[2][:total_cost]).to eq(1025.0)
        expect(trips[2][:attributes]).to be_a Hash
        expect(trips[2][:attributes].keys).to eq([:nights, :meals, :courses])
        expect(trips[2][:attributes][:nights]).to be_an Array
        expect(trips[2][:attributes][:nights].length).to eq(7)
        expect(trips[2][:attributes][:nights][0]).to be_a Hash
        expect(trips[2][:attributes][:courses]).to be_an Array
        expect(trips[2][:attributes][:courses].length).to eq(6)
        expect(trips[2][:attributes][:courses][0]).to be_a Hash
        expect(trips[2][:attributes][:courses][0][:name]).to eq(@trip_4_course_1.course.name)
        expect(trips[2][:attributes][:courses][1][:name]).to eq(@trip_4_course_2.course.name)
        expect(trips[2][:attributes][:courses][2][:name]).to eq(@trip_4_course_3.course.name)
        expect(trips[2][:attributes][:courses][3][:name]).to eq(@trip_4_course_4.course.name)
        expect(trips[2][:attributes][:courses][4][:name]).to eq(@trip_4_course_5.course.name)
        expect(trips[2][:attributes][:courses][5][:name]).to eq(@trip_4_course_6.course.name)
        expect(trips[2][:attributes][:meals]).to be_an Array
        expect(trips[2][:attributes][:meals].length).to eq(13)
        expect(trips[2][:attributes][:meals][0]).to be_a Hash
      end
    end
  end

  describe 'POST /golfers/:id/golfer_trips' do
    describe 'happy path' do
      it 'returns a 201 created response with the new trip data' do
        golfer_3 = Golfer.create!(first_name: 'Christopher', last_name: 'Moltisanti', email: 'chrissie@badabing.com', password: 'test123', password_confirmation: 'test123')
        json_payload = {
        golfer_trip: {
            golfer_id: golfer_3.id,
            trip_id: @trip_4.id,
            nights: [
              @night_4_trip_4.id,
              @night_5_trip_4.id,
              @night_6_trip_4.id,
              @night_7_trip_4.id
              ],
            meals: [
              @meal_6_trip_4.id,
              @meal_7_trip_4.id,
              @meal_8_trip_4.id,
              @meal_9_trip_4.id,
              @meal_10_trip_4.id,
              @meal_11_trip_4.id,
              @meal_12_trip_4.id,
              @meal_13_trip_4.id
            ],
            courses: [
              @trip_4_course_4.id,
              @trip_4_course_5.id,
              @trip_4_course_6.id
            ],
          },
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post "/api/v1/golfers/#{golfer_3.id}/golfer_trips", headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(201)

        response_body = JSON.parse(response.body, symbolize_names: true)
        trip = response_body[:data]

        expect(trip).to be_a Hash
        expect(trip[:id]).to eq(@trip_4.id)
        expect(trip[:type]).to eq('golfer_trip')
        expect(trip[:total_cost]).to eq(620.0)
        expect(trip[:attributes]).to be_a Hash
        expect(trip[:attributes].keys).to eq([:nights, :meals, :courses])
        expect(trip[:attributes][:nights]).to be_an Array
        expect(trip[:attributes][:nights].length).to eq(4)
        expect(trip[:attributes][:nights][0]).to be_a Hash
        expect(trip[:attributes][:nights][0][:date]).to eq(@night_4_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:nights][1][:date]).to eq(@night_5_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:nights][2][:date]).to eq(@night_6_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:nights][3][:date]).to eq(@night_7_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:courses]).to be_an Array
        expect(trip[:attributes][:courses].length).to eq(3)
        expect(trip[:attributes][:courses][0]).to be_a Hash
        expect(trip[:attributes][:courses][0][:date]).to eq(@trip_4_course_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:courses][0][:name]).to eq(@trip_4_course_4.course.name)
        expect(trip[:attributes][:courses][0][:address]).to eq(@trip_4_course_4.course.address)
        expect(trip[:attributes][:courses][0][:city]).to eq(@trip_4_course_4.course.city)
        expect(trip[:attributes][:courses][0][:state]).to eq(@trip_4_course_4.course.state)
        expect(trip[:attributes][:courses][0][:zip]).to eq(@trip_4_course_4.course.zipcode)
        expect(trip[:attributes][:courses][1][:name]).to eq(@trip_4_course_5.course.name)
        expect(trip[:attributes][:courses][2][:name]).to eq(@trip_4_course_6.course.name)
        expect(trip[:attributes][:meals]).to be_an Array
        expect(trip[:attributes][:meals].length).to eq(8)
        expect(trip[:attributes][:meals][0]).to be_a Hash
        expect(trip[:attributes][:meals][0][:date]).to eq(@meal_6_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][1][:date]).to eq(@meal_7_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][2][:date]).to eq(@meal_8_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][3][:date]).to eq(@meal_9_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][4][:date]).to eq(@meal_10_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][5][:date]).to eq(@meal_11_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][6][:date]).to eq(@meal_12_trip_4.date.strftime('%Y-%m-%d'))
        expect(trip[:attributes][:meals][7][:date]).to eq(@meal_13_trip_4.date.strftime('%Y-%m-%d'))
      end
    end
  end
end
