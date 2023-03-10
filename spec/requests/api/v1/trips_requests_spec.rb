require 'rails_helper'

describe 'golfer endpoints' do
  before do
    @golfer_1 = Golfer.create!(first_name: 'Tony', last_name: 'Soprano', email: 't@badabing.com', password: 'test123', password_confirmation: 'test123')
    @golfer_2 = Golfer.create!(first_name: 'Paulie', last_name: 'Gaultieri', email: 'walnuts@badabing.com', password: 'test123', password_confirmation: 'test123')
    @golfer_3 = Golfer.create!(first_name: 'Christopher', last_name: 'Moltisanti', email: 'chrissie@badabing.com', password: 'test123', password_confirmation: 'test123')

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

  describe 'GET /trips' do
    describe 'happy path' do
      it 'returns all trips with their years, numbers, and locations' do
        get "/api/v1/trips?api_key=#{ENV["API_KEY"]}", headers: headers

        expect(response).to have_http_status(200)

        response_body = JSON.parse(response.body, symbolize_names: true)
        trips = response_body[:data]

        expect(trips).to be_an Array
        expect(trips.length).to eq(4)
        expect(trips[0]).to be_a Hash
        expect(trips[0].keys).to eq([:id, :type, :attributes])
        expect(trips[0][:type]).to eq('trip')
        expect(trips[0][:attributes].keys).to eq([:year, :number, :location, :start_date, :calendar, :golfers])
        expect(trips[0][:attributes][:year]).to eq(2013)
        expect(trips[0][:attributes][:number]).to eq('XIII')
        expect(trips[0][:attributes][:location]).to eq('Dewey Beach')
        expect(trips[1][:attributes][:year]).to eq(2014)
        expect(trips[1][:attributes][:number]).to eq('XIV')
        expect(trips[1][:attributes][:location]).to eq('Rehoboth Beach')
        expect(trips[2][:attributes][:year]).to eq(2015)
        expect(trips[2][:attributes][:number]).to eq('XV')
        expect(trips[2][:attributes][:location]).to eq('VA Beach')
        expect(trips[3][:attributes][:year]).to eq(2016)
        expect(trips[3][:attributes][:number]).to eq('XVI')
        expect(trips[3][:attributes][:location]).to eq('VA Beach')
      end
    end
  end

  describe 'GET /trips/:id' do
    describe 'happy path' do
      it 'returns a trips year, number, and location, courses, nights, and meals
          along with all the golfers attending and the cost they owe' do
        get "/api/v1/trips/#{@trip_1.id}?api_key=#{ENV["API_KEY"]}", headers: headers

        expect(response).to have_http_status(200)

        response_body = JSON.parse(response.body, symbolize_names: true)
        trip = response_body[:data]
        
        expect(trip).to be_a Hash
        expect(trip.keys).to eq([:id, :type, :attributes])
        expect(trip[:id]).to eq(@trip_1.id.to_s)
        expect(trip[:type]).to eq('trip')
        expect(trip[:attributes]).to be_a Hash
        expect(trip[:attributes].keys).to eq([:year, :number, :location, :start_date, :calendar, :golfers])
        expect(trip[:attributes][:year]).to eq(@trip_1.year)
        expect(trip[:attributes][:number]).to eq(@trip_1.number)
        expect(trip[:attributes][:location]).to eq(@trip_1.location)
        expect(trip[:attributes][:calendar]).to be_an Array
        expect(trip[:attributes][:calendar].length).to eq(8)
        expect(trip[:attributes][:golfers]).to be_an Array
        expect(trip[:attributes][:golfers].length).to eq(2)
        expect(trip[:attributes][:golfers][0]).to be_a Hash
        expect(trip[:attributes][:golfers][0].keys).to eq([:id, :name, :email, :cost])
        expect(trip[:attributes][:golfers][0][:id]).to eq(@golfer_1.id)
        expect(trip[:attributes][:golfers][0][:name]).to eq("Tony Soprano")
        expect(trip[:attributes][:golfers][0][:email]).to eq(@golfer_1.email)
        expect(trip[:attributes][:golfers][0][:cost]).to eq(660.0)
      end
    end
  end

  describe 'GET /next_trip' do 
    describe 'happy path' do 
      it 'returns trip data for the next years trip' do 
        @trip_4 = Trip.create!(year: 2016, number: 'XVI', location: 'VA Beach', start_date: Date.parse('2024-04-21'))
        @night_1_trip_4 = @trip_4.nights.create!(date: Date.parse('2024-04-21'), cost: 0.0)
        @night_2_trip_4 = @trip_4.nights.create!(date: Date.parse('2024-04-22'), cost: 70.0)
        @night_3_trip_4 = @trip_4.nights.create!(date: Date.parse('2024-04-23'), cost: 70.0)
        @night_4_trip_4 = @trip_4.nights.create!(date: Date.parse('2024-04-24'), cost: 70.0)
        @night_5_trip_4 = @trip_4.nights.create!(date: Date.parse('2024-04-25'), cost: 70.0)
        @night_6_trip_4 = @trip_4.nights.create!(date: Date.parse('2024-04-26'), cost: 70.0)
        @night_7_trip_4 = @trip_4.nights.create!(date: Date.parse('2024-04-27'), cost: 70.0)
        @meal_1_trip_4 = @trip_4.meals.create!(date: Date.parse('2024-04-22'), time_of_day: 0, cost: 5.0)
        @meal_2_trip_4 = @trip_4.meals.create!(date: Date.parse('2024-04-22'), time_of_day: 1, cost: 5.0)
        @meal_3_trip_4 = @trip_4.meals.create!(date: Date.parse('2024-04-23'), time_of_day: 0, cost: 5.0)
        @meal_4_trip_4 = @trip_4.meals.create!(date: Date.parse('2024-04-23'), time_of_day: 1, cost: 5.0)
        @meal_5_trip_4 = @trip_4.meals.create!(date: Date.parse('2024-04-24'), time_of_day: 0, cost: 5.0)
        @meal_6_trip_4 = @trip_4.meals.create!(date: Date.parse('2024-04-24'), time_of_day: 1, cost: 5.0)
        @meal_7_trip_4 = @trip_4.meals.create!(date: Date.parse('2024-04-25'), time_of_day: 0, cost: 5.0)
        @meal_8_trip_4 = @trip_4.meals.create!(date: Date.parse('2024-04-25'), time_of_day: 1, cost: 5.0)
        @meal_9_trip_4 = @trip_4.meals.create!(date: Date.parse('2024-04-26'), time_of_day: 0, cost: 5.0)
        @meal_10_trip_4 = @trip_4.meals.create!(date: Date.parse('2024-04-26'), time_of_day: 1, cost: 5.0)
        @meal_11_trip_4 = @trip_4.meals.create!(date: Date.parse('2024-04-27'), time_of_day: 0, cost: 5.0)
        @meal_12_trip_4 = @trip_4.meals.create!(date: Date.parse('2024-04-27'), time_of_day: 1, cost: 5.0)
        @meal_13_trip_4 = @trip_4.meals.create!(date: Date.parse('2024-04-28'), time_of_day: 0, cost: 5.0)
        @trip_4_course_1 = @trip_4.trip_courses.create!(course: @course_1, date: Date.parse('2024-04-22'), cost: 65)
        @trip_4_course_2 = @trip_4.trip_courses.create!(course: @course_2, date: Date.parse('2024-04-23'), cost: 65)
        @trip_4_course_3 = @trip_4.trip_courses.create!(course: @course_3, date: Date.parse('2024-04-24'), cost: 65)
        @trip_4_course_4 = @trip_4.trip_courses.create!(course: @course_4, date: Date.parse('2024-04-25'), cost: 65)
        @trip_4_course_5 = @trip_4.trip_courses.create!(course: @course_1, date: Date.parse('2024-04-26'), cost: 65)
        @trip_4_course_6 = @trip_4.trip_courses.create!(course: @course_2, date: Date.parse('2024-04-27'), cost: 65)

        get "/api/v1/next_trip?api_key=#{ENV["API_KEY"]}", headers: headers

        expect(response).to have_http_status(200)

        response_body = JSON.parse(response.body, symbolize_names: true)
        trip = response_body[:data]
        
        expect(trip).to be_a Hash
        expect(trip.keys).to eq([:id, :type, :attributes])
        expect(trip[:id]).to eq(@trip_4.id.to_s)
        expect(trip[:type]).to eq('trip')
        expect(trip[:attributes]).to be_a Hash
        expect(trip[:attributes].keys).to eq([:year, :number, :location, :start_date, :calendar, :golfers])
        expect(trip[:attributes][:year]).to eq(@trip_4.year)
        expect(trip[:attributes][:number]).to eq(@trip_4.number)
        expect(trip[:attributes][:location]).to eq(@trip_4.location)
        expect(trip[:attributes][:calendar]).to be_an Array
        expect(trip[:attributes][:calendar].length).to eq(8)
        expect(trip[:attributes][:golfers]).to be_an Array
        expect(trip[:attributes][:golfers].length).to eq(0)
      end
    end

    describe 'sad path' do 
      it 'does not return any trip data if there is no upcoming trip yet in the database' do 
        get "/api/v1/next_trip?api_key=#{ENV["API_KEY"]}", headers: headers

        expect(response).to have_http_status(200)

        response_body = JSON.parse(response.body, symbolize_names: true)
        trip = response_body[:data]

        expect(trip).to be_a Hash 
        expect(trip.keys).to be_empty
      end
    end
  end

  describe 'POST /trips' do
    describe 'happy path' do
      it 'creates a new trip and returns a json serialization of the new trip' do
        json_payload = {
          year: 2017,
          number: 'XVII',
          location: 'VA Beach',
          courses: [
            {
              course: @course_5.id,
              date: Date.parse('2017-04-24'),
              cost: 65.0
            },
            {
              course: @course_6.id,
              date: Date.parse('2017-04-25'),
              cost: 65.0
            },
            {
              course: @course_7.id,
              date: Date.parse('2017-04-26'),
              cost: 65.0
            },
            {
              course: @course_8.id,
              date: Date.parse('2017-04-27'),
              cost: 65.0
            },
            {
              course: @course_5.id,
              date: Date.parse('2017-04-28'),
              cost: 65.0
            },
            {
              course: @course_9.id,
              date: Date.parse('2017-04-29'),
              cost: 65.0
            },
          ],
          nights: [
            {
              date: Date.parse('2017-04-23'),
              cost: 0.0
            },
            {
              date: Date.parse('2017-04-24'),
              cost: 90.0
            },
            {
              date: Date.parse('2017-04-25'),
              cost: 90.0
            },
            {
              date: Date.parse('2017-04-26'),
              cost: 90.0
            },
            {
              date: Date.parse('2017-04-27'),
              cost: 90.0
            },
            {
              date: Date.parse('2017-04-28'),
              cost: 90.0
            },
            {
              date: Date.parse('2017-04-29'),
              cost: 90.0
            }
          ],
          meals: [
            {
              date: Date.parse('2017-04-24'),
              time_of_day: 0,
              cost: 5.0
            },
            {
              date: Date.parse('2017-04-24'),
              time_of_day: 1,
              cost: 5.0
            },
            {
              date: Date.parse('2017-04-25'),
              time_of_day: 0,
              cost: 5.0
            },
            {
              date: Date.parse('2017-04-25'),
              time_of_day: 1,
              cost: 5.0
            },
            {
              date: Date.parse('2017-04-26'),
              time_of_day: 0,
              cost: 5.0
            },
            {
              date: Date.parse('2017-04-26'),
              time_of_day: 1,
              cost: 5.0
            },
            {
              date: Date.parse('2017-04-27'),
              time_of_day: 0,
              cost: 5.0
            },
            {
              date: Date.parse('2017-04-27'),
              time_of_day: 1,
              cost: 5.0
            },
            {
              date: Date.parse('2017-04-28'),
              time_of_day: 0,
              cost: 5.0
            },
            {
              date: Date.parse('2017-04-28'),
              time_of_day: 1,
              cost: 5.0
            },
            {
              date: Date.parse('2017-04-29'),
              time_of_day: 0,
              cost: 5.0
            },
            {
              date: Date.parse('2017-04-29'),
              time_of_day: 1,
              cost: 5.0
            },
            {
              date: Date.parse('2017-04-30'),
              time_of_day: 0,
              cost: 5.0
            }
          ],
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/trips', headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(201)

        response_body = JSON.parse(response.body, symbolize_names: true)
        trip = response_body[:data]

        expect(trip).to be_a Hash
        expect(trip.keys).to eq([:id, :type, :attributes])
        expect(trip[:id]).to be_an String
        expect(trip[:type]).to eq('trip')
        expect(trip[:attributes]).to be_a Hash
        expect(trip[:attributes].keys).to eq([:year, :number, :location, :start_date, :calendar, :golfers])
        expect(trip[:attributes][:year]).to eq(2017)
        expect(trip[:attributes][:number]).to eq('XVII')
        expect(trip[:attributes][:location]).to eq('VA Beach')
      end
    end
  end
end
