# KPC - Back End

## Overview

KPC is an app used for management of the world's most glorious golf outing, the Kitchen Pass Classic, which I have had the good fortune of attending with my Father and all of his best buddies since I was a Senior in High School, and which all of my best buddies have begun attending since around the same time. 

This is the documentation for the Back End app, which is a REST API written in Ruby on Rails (Ruby Version 2.7.4 / Rails Version 5.2.8). It contains the PostgreSQL relational database and exposes endpoints generating serialized JSON responses for use on the Front End. 

## Database Schema 

<img width="1419" alt="image" src="https://user-images.githubusercontent.com/93609855/212140683-f1b63ad7-99eb-426f-8611-aebfc87043d5.png">

## Endpoints

1. [GET /api/v1/golfers](#get_golfers)
2. [POST /api/v1/golfers](#create_golfer)
3. [DELETE /api/v1/golfers/:id](#delete_golfer)
4. [POST /api/v1/sessions](#create_session)
5. [GET /api/v1/golfers/:golfer_id/golfer_trips](#get_golfer_trips)
6. [GET /api/v1/golfers/:golfer_id/golfer_trips/:trip_id](#get_golfer_trip)
7. [POST /api/v1/golfers/:golfer_id/golfer_trips](#create_golfer_trip)
8. [GET /api/v1/trips](#get_trips)
9. [GET /api/v1/trips/:id](#get_trip)
10. [POST /api/v1/trips](#create_trip)
11. [GET /api/v1/courses](#get_courses)
12. [POST /api/v1/courses](#create_course)

### Note: 

All requests must include an `api_key` parameter, whether as a query param in the URI for `GET` requests or in the JSON payload for any other requests. Requests are authenticated by checking this parameter against the `API_KEY` environment variable, which is hidden from this repository using the `figaro` gem, included in the Gemfile. Documentation for use of this gem can be found [here](https://github.com/laserlemon/figaro).

---

### GET /api/v1/golfers <a name="get_golfers"></a>

This endpoint returns all of the golfers in the database, including all of their attributes except for their `password_digest`, which is just an encryption of their password. This includes `first_name`, `last_name`, `email`, and `role`. 

Example response: 

```
{
    "data": [
        {
            "id": "1",
            "type": "golfer",
            "attributes": {
                "first_name": "Tony",
                "last_name": "Soprano",
                "email": "t@badabing.com",
                "role": "default"
            }
        },
        {
            "id": "2",
            "type": "golfer",
            "attributes": {
                "first_name": "Paulie",
                "last_name": "Gaultieri",
                "email": "walnuts@badabing.com",
                "role": "default"
            }
        },
        {
            "id": "3",
            "type": "golfer",
            "attributes": {
                "first_name": "Christopher",
                "last_name": "Moltisanti",
                "email": "chrissie@badabing.com",
                "role": "default"
            }
        }
    ]
}
```

### POST /api/v1/golfers <a name="create_golfer"></a>

This endpoint is used to create a new golfer in the database. The required parameters are `first_name`, `last_name`, `email`, `password`, and `password_confirmation`. The `email` parameter must satisfy the `Golfer` model uniqueness validation, and the `password` and `password_confirmation` must match. 

Example request:

```
{
    "first_name": "Tony",
    "last_name": "Soprano",
    "email": "t@badabing.com",
    "password": "varsityAthlete",
    "password_confirmation": "varsityAthlete"
}
```

Example response:

```
{
    "data": {
        "id": "1",
        "type": "golfer",
        "attributes": {
            "first_name": "Tony",
            "last_name": "Soprano",
            "email": "t@badabing.com",
            "role": "default"
        }
    }
}
```

### DELETE /api/v1/golfers/:id <a name="delete_golfer"></a>

This endpoint destroys the golfer in the database with the `id` passed in as a query parameter. This is the only parameter required. It produces a response of "no content."

### POST /api/v1/sessions <a name="create_session"></a>

This endpoint returns relevant golfer data after authentication. The required parameters are `email` and `password`. If a golfer is found in the database with that email address and authenticated with the password, then the user is returned.

Example request:

```
{
    "email": "t@badabing.com",
    "password": "varsityAthlete"
}
```

Example response:

```
{
    "data": {
        "id": "1",
        "type": "golfer",
        "attributes": {
            "first_name": "Tony",
            "last_name": "Soprano",
            "email": "t@badabing.com",
            "role": "default"
        }
    }
}
```

### GET /api/v1/golfers/:golfer_id/golfer_trips <a name="get_golfer_trips"></a>

This endpoint returns data for each trip that a given golfer has attended, including the total cost of the trip to the golfer, all the nights he stayed in the house, all the meals he ate, and all the courses he played. The only parameter that needs to be passed back for this endpoint is the `golfer_id`, which should be included in the URI.

Example response: 

```
{
    "data": [
        {
            "id": 1,
            "type": "golfer_trip",
            "trip_number": 13,
            "total_cost": 660.0,
            "attributes": {
                "nights": [
                    {
                        "id": 3,
                        "date": "2013-04-23"
                    },
                    {
                        "id": 4,
                        "date": "2013-04-24"
                    },
                    {
                        "id": 5,
                        "date": "2013-04-25"
                    },
                    {
                        "id": 6,
                        "date": "2013-04-26"
                    },
                    {
                        "id": 7,
                        "date": "2013-04-27"
                    }
                ],
                "meals": [
                    {
                        "id": 4,
                        "date": "2013-04-23",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 5,
                        "date": "2013-04-24",
                        "time_of_day": "breakfast"
                    },
                    {
                        "id": 6,
                        "date": "2013-04-24",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 7,
                        "date": "2013-04-25",
                        "time_of_day": "breakfast"
                    },
                    {
                        "id": 8,
                        "date": "2013-04-25",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 9,
                        "date": "2013-04-26",
                        "time_of_day": "breakfast"
                    },
                    {
                        "id": 10,
                        "date": "2013-04-26",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 11,
                        "date": "2013-04-27",
                        "time_of_day": "breakfast"
                    },
                    {
                        "id": 12,
                        "date": "2013-04-27",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 13,
                        "date": "2013-04-28",
                        "time_of_day": "breakfast"
                    }
                ],
                "courses": [
                    {
                        "course_id": 3,
                        "trip_course_id": 3,
                        "date": "2013-04-24",
                        "name": "The Salt Pond Golf Club",
                        "address": "402 Bethany Loop",
                        "city": "Bethany Beach",
                        "state": "DE",
                        "zip": "19930"
                    },
                    {
                        "course_id": 4,
                        "trip_course_id": 4,
                        "date": "2013-04-25",
                        "name": "American Classic Golf Club",
                        "address": "18485 Bethpage Dr",
                        "city": "Lewes",
                        "state": "DE",
                        "zip": "19958"
                    },
                    {
                        "course_id": 1,
                        "trip_course_id": 5,
                        "date": "2013-04-26",
                        "name": "Kings Creek Country Club",
                        "address": "1 Kings Creek Cir",
                        "city": "Rehoboth Beach",
                        "state": "DE",
                        "zip": "19971"
                    },
                    {
                        "course_id": 2,
                        "trip_course_id": 6,
                        "date": "2013-04-27",
                        "name": "Rehoboth Country Club",
                        "address": "221 West Side Dr",
                        "city": "Rehoboth Beach",
                        "state": "DE",
                        "zip": "19971"
                    }
                ]
            }
        },
        {
            "id": 2,
            "type": "golfer_trip",
            "trip_number": 14,
            "total_cost": 570.0,
            "attributes": {
                "nights": [
                    {
                        "id": 11,
                        "date": "2014-04-23"
                    },
                    {
                        "id": 12,
                        "date": "2014-04-24"
                    },
                    {
                        "id": 13,
                        "date": "2014-04-25"
                    },
                    {
                        "id": 14,
                        "date": "2014-04-26"
                    }
                ],
                "meals": [
                    {
                        "id": 19,
                        "date": "2014-04-23",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 20,
                        "date": "2014-04-24",
                        "time_of_day": "breakfast"
                    },
                    {
                        "id": 21,
                        "date": "2014-04-24",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 22,
                        "date": "2014-04-25",
                        "time_of_day": "breakfast"
                    },
                    {
                        "id": 23,
                        "date": "2014-04-25",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 24,
                        "date": "2014-04-26",
                        "time_of_day": "breakfast"
                    },
                    {
                        "id": 25,
                        "date": "2014-04-26",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 26,
                        "date": "2014-04-27",
                        "time_of_day": "breakfast"
                    }
                ],
                "courses": [
                    {
                        "course_id": 4,
                        "trip_course_id": 10,
                        "date": "2014-04-24",
                        "name": "American Classic Golf Club",
                        "address": "18485 Bethpage Dr",
                        "city": "Lewes",
                        "state": "DE",
                        "zip": "19958"
                    },
                    {
                        "course_id": 1,
                        "trip_course_id": 11,
                        "date": "2014-04-25",
                        "name": "Kings Creek Country Club",
                        "address": "1 Kings Creek Cir",
                        "city": "Rehoboth Beach",
                        "state": "DE",
                        "zip": "19971"
                    },
                    {
                        "course_id": 3,
                        "trip_course_id": 12,
                        "date": "2014-04-26",
                        "name": "The Salt Pond Golf Club",
                        "address": "402 Bethany Loop",
                        "city": "Bethany Beach",
                        "state": "DE",
                        "zip": "19930"
                    }
                ]
            }
        },
        {
            "id": 4,
            "type": "golfer_trip",
            "trip_number": 16,
            "total_cost": 1025.0,
            "attributes": {
                "nights": [
                    {
                        "id": 22,
                        "date": "2016-04-24"
                    },
                    {
                        "id": 23,
                        "date": "2016-04-25"
                    },
                    {
                        "id": 24,
                        "date": "2016-04-26"
                    },
                    {
                        "id": 25,
                        "date": "2016-04-27"
                    },
                    {
                        "id": 26,
                        "date": "2016-04-28"
                    },
                    {
                        "id": 27,
                        "date": "2016-04-29"
                    },
                    {
                        "id": 28,
                        "date": "2016-04-30"
                    }
                ],
                "meals": [
                    {
                        "id": 40,
                        "date": "2016-04-25",
                        "time_of_day": "breakfast"
                    },
                    {
                        "id": 41,
                        "date": "2016-04-25",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 42,
                        "date": "2016-04-26",
                        "time_of_day": "breakfast"
                    },
                    {
                        "id": 43,
                        "date": "2016-04-26",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 44,
                        "date": "2016-04-27",
                        "time_of_day": "breakfast"
                    },
                    {
                        "id": 45,
                        "date": "2016-04-27",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 46,
                        "date": "2016-04-28",
                        "time_of_day": "breakfast"
                    },
                    {
                        "id": 47,
                        "date": "2016-04-28",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 48,
                        "date": "2016-04-29",
                        "time_of_day": "breakfast"
                    },
                    {
                        "id": 49,
                        "date": "2016-04-29",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 50,
                        "date": "2016-04-30",
                        "time_of_day": "breakfast"
                    },
                    {
                        "id": 51,
                        "date": "2016-04-30",
                        "time_of_day": "dinner"
                    },
                    {
                        "id": 52,
                        "date": "2016-05-01",
                        "time_of_day": "breakfast"
                    }
                ],
                "courses": [
                    {
                        "course_id": 5,
                        "trip_course_id": 19,
                        "date": "2016-04-25",
                        "name": "Red Wing Lake Golf Course",
                        "address": "1144 Prosperity Rd",
                        "city": "Virginia Beach",
                        "state": "VA",
                        "zip": "23451"
                    },
                    {
                        "course_id": 6,
                        "trip_course_id": 20,
                        "date": "2016-04-26",
                        "name": "Virginia Beach National Golf Club",
                        "address": "2500 Tournament Dr",
                        "city": "Virginia Beach",
                        "state": "VA",
                        "zip": "23456"
                    },
                    {
                        "course_id": 7,
                        "trip_course_id": 21,
                        "date": "2016-04-27",
                        "name": "Hells Point Golf Club",
                        "address": "2700 Atwoodtown Rd",
                        "city": "Virginia Beach",
                        "state": "VA",
                        "zip": "23456"
                    },
                    {
                        "course_id": 8,
                        "trip_course_id": 22,
                        "date": "2016-04-28",
                        "name": "Heron Ridge Golf Club",
                        "address": "2973 Heron Ridge Dr",
                        "city": "Virginia Beach",
                        "state": "VA",
                        "zip": "23456"
                    },
                    {
                        "course_id": 9,
                        "trip_course_id": 23,
                        "date": "2016-04-29",
                        "name": "Stumpy Lake Golf Course",
                        "address": "4797 Indian River Rd",
                        "city": "Virginia Beach",
                        "state": "VA",
                        "zip": "23456"
                    },
                    {
                        "course_id": 5,
                        "trip_course_id": 24,
                        "date": "2016-04-30",
                        "name": "Red Wing Lake Golf Course",
                        "address": "1144 Prosperity Rd",
                        "city": "Virginia Beach",
                        "state": "VA",
                        "zip": "23451"
                    }
                ]
            }
        }
    ]
}
```

### GET /api/v1/golfers/:golfer_id/golfer_trips/:trip_id <a name="get_golfer_trip"></a>

This endpoint returns data for a given trip that a given golfer has attended, including the total cost of the trip to the golfer, all the nights he stayed in the house, all the meals he ate, and all the courses he played. The only parameters that need to be passed back for this endpoint are the `golfer_id` and the `trip_id`, which should be included in the URI.

Example response:

```
{
    "data": {
        "id": 4,
        "type": "golfer_trip",
        "trip_number": 16,
        "total_cost": 1025.0,
        "attributes": {
            "nights": [
                {
                    "id": 22,
                    "date": "2016-04-24"
                },
                {
                    "id": 23,
                    "date": "2016-04-25"
                },
                {
                    "id": 24,
                    "date": "2016-04-26"
                },
                {
                    "id": 25,
                    "date": "2016-04-27"
                },
                {
                    "id": 26,
                    "date": "2016-04-28"
                },
                {
                    "id": 27,
                    "date": "2016-04-29"
                },
                {
                    "id": 28,
                    "date": "2016-04-30"
                }
            ],
            "meals": [
                {
                    "id": 40,
                    "date": "2016-04-25",
                    "time_of_day": "breakfast"
                },
                {
                    "id": 41,
                    "date": "2016-04-25",
                    "time_of_day": "dinner"
                },
                {
                    "id": 42,
                    "date": "2016-04-26",
                    "time_of_day": "breakfast"
                },
                {
                    "id": 43,
                    "date": "2016-04-26",
                    "time_of_day": "dinner"
                },
                {
                    "id": 44,
                    "date": "2016-04-27",
                    "time_of_day": "breakfast"
                },
                {
                    "id": 45,
                    "date": "2016-04-27",
                    "time_of_day": "dinner"
                },
                {
                    "id": 46,
                    "date": "2016-04-28",
                    "time_of_day": "breakfast"
                },
                {
                    "id": 47,
                    "date": "2016-04-28",
                    "time_of_day": "dinner"
                },
                {
                    "id": 48,
                    "date": "2016-04-29",
                    "time_of_day": "breakfast"
                },
                {
                    "id": 49,
                    "date": "2016-04-29",
                    "time_of_day": "dinner"
                },
                {
                    "id": 50,
                    "date": "2016-04-30",
                    "time_of_day": "breakfast"
                },
                {
                    "id": 51,
                    "date": "2016-04-30",
                    "time_of_day": "dinner"
                },
                {
                    "id": 52,
                    "date": "2016-05-01",
                    "time_of_day": "breakfast"
                }
            ],
            "courses": [
                {
                    "course_id": 5,
                    "trip_course_id": 19,
                    "date": "2016-04-25",
                    "name": "Red Wing Lake Golf Course",
                    "address": "1144 Prosperity Rd",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23451"
                },
                {
                    "course_id": 6,
                    "trip_course_id": 20,
                    "date": "2016-04-26",
                    "name": "Virginia Beach National Golf Club",
                    "address": "2500 Tournament Dr",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23456"
                },
                {
                    "course_id": 7,
                    "trip_course_id": 21,
                    "date": "2016-04-27",
                    "name": "Hells Point Golf Club",
                    "address": "2700 Atwoodtown Rd",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23456"
                },
                {
                    "course_id": 8,
                    "trip_course_id": 22,
                    "date": "2016-04-28",
                    "name": "Heron Ridge Golf Club",
                    "address": "2973 Heron Ridge Dr",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23456"
                },
                {
                    "course_id": 9,
                    "trip_course_id": 23,
                    "date": "2016-04-29",
                    "name": "Stumpy Lake Golf Course",
                    "address": "4797 Indian River Rd",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23456"
                },
                {
                    "course_id": 5,
                    "trip_course_id": 24,
                    "date": "2016-04-30",
                    "name": "Red Wing Lake Golf Course",
                    "address": "1144 Prosperity Rd",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23451"
                }
            ]
        }
    }
}
```

### POST /api/v1/golfers/:golfer_id/golfer_trips <a name="create_golfer_trip"></a>

This endpoint creates a new `golfer_trip` for a given `golfer` and returns data for that new trip, including the total cost of the trip to the golfer, all the nights he will stay in the house, all the meals he will eat, and all the courses he will play. This endpoint requires more paramaters, including the `id` attributes for the golfer himself, the trip he will attend, each night he will stay, each meal he will eat, and each course he will play. 

Example request:

```
{
    "golfer_id":3,
    "trip_id":4,
    "nights":[25,26,27,28],
    "meals":[45,46,47,48,49,50,51,52],
    "courses":[22,23,24]
}
```

Example response:

```
{
    "data": {
        "id": 4,
        "type": "golfer_trip",
        "trip_number": 16,
        "total_cost": 620.0,
        "attributes": {
            "nights": [
                {
                    "id": 25,
                    "date": "2016-04-27"
                },
                {
                    "id": 26,
                    "date": "2016-04-28"
                },
                {
                    "id": 27,
                    "date": "2016-04-29"
                },
                {
                    "id": 28,
                    "date": "2016-04-30"
                }
            ],
            "meals": [
                {
                    "id": 45,
                    "date": "2016-04-27",
                    "time_of_day": "dinner"
                },
                {
                    "id": 46,
                    "date": "2016-04-28",
                    "time_of_day": "breakfast"
                },
                {
                    "id": 47,
                    "date": "2016-04-28",
                    "time_of_day": "dinner"
                },
                {
                    "id": 48,
                    "date": "2016-04-29",
                    "time_of_day": "breakfast"
                },
                {
                    "id": 49,
                    "date": "2016-04-29",
                    "time_of_day": "dinner"
                },
                {
                    "id": 50,
                    "date": "2016-04-30",
                    "time_of_day": "breakfast"
                },
                {
                    "id": 51,
                    "date": "2016-04-30",
                    "time_of_day": "dinner"
                },
                {
                    "id": 52,
                    "date": "2016-05-01",
                    "time_of_day": "breakfast"
                }
            ],
            "courses": [
                {
                    "course_id": 8,
                    "trip_course_id": 22,
                    "date": "2016-04-28",
                    "name": "Heron Ridge Golf Club",
                    "address": "2973 Heron Ridge Dr",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23456"
                },
                {
                    "course_id": 9,
                    "trip_course_id": 23,
                    "date": "2016-04-29",
                    "name": "Stumpy Lake Golf Course",
                    "address": "4797 Indian River Rd",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23456"
                },
                {
                    "course_id": 5,
                    "trip_course_id": 24,
                    "date": "2016-04-30",
                    "name": "Red Wing Lake Golf Course",
                    "address": "1144 Prosperity Rd",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23451"
                }
            ]
        }
    }
}
```


### GET /api/v1/trips <a name="get_trips"></a>

This endpoint returns all trips in the database, including their `year`, `number`, and `location` attributes, along with its `nights`, `meals`, `courses`, and `golfers`. It does not require any parameters. 

Example response: 

```
{
    "data": [
        {
            "id": "1",
            "type": "trip",
            "attributes": {
                "year": 2013,
                "number": 13,
                "location": "Dewey Beach",
                "nights": [
                    {
                        "id": 1,
                        "date": "2013-04-21",
                        "cost": 0.0
                    },
                    {
                        "id": 2,
                        "date": "2013-04-22",
                        "cost": 70.0
                    },
                    {
                        "id": 3,
                        "date": "2013-04-23",
                        "cost": 70.0
                    },
                    {
                        "id": 4,
                        "date": "2013-04-24",
                        "cost": 70.0
                    },
                    {
                        "id": 5,
                        "date": "2013-04-25",
                        "cost": 70.0
                    },
                    {
                        "id": 6,
                        "date": "2013-04-26",
                        "cost": 70.0
                    },
                    {
                        "id": 7,
                        "date": "2013-04-27",
                        "cost": 70.0
                    }
                ],
                "meals": [
                    {
                        "id": 1,
                        "date": "2013-04-22",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 2,
                        "date": "2013-04-22",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 3,
                        "date": "2013-04-23",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 4,
                        "date": "2013-04-23",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 5,
                        "date": "2013-04-24",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 6,
                        "date": "2013-04-24",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 7,
                        "date": "2013-04-25",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 8,
                        "date": "2013-04-25",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 9,
                        "date": "2013-04-26",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 10,
                        "date": "2013-04-26",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 11,
                        "date": "2013-04-27",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 12,
                        "date": "2013-04-27",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 13,
                        "date": "2013-04-28",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    }
                ],
                "courses": [
                    {
                        "id": 1,
                        "name": "Kings Creek Country Club",
                        "date": "2013-04-22",
                        "cost": 65.0
                    },
                    {
                        "id": 2,
                        "name": "Rehoboth Country Club",
                        "date": "2013-04-23",
                        "cost": 65.0
                    },
                    {
                        "id": 3,
                        "name": "The Salt Pond Golf Club",
                        "date": "2013-04-24",
                        "cost": 65.0
                    },
                    {
                        "id": 4,
                        "name": "American Classic Golf Club",
                        "date": "2013-04-25",
                        "cost": 65.0
                    },
                    {
                        "id": 5,
                        "name": "Kings Creek Country Club",
                        "date": "2013-04-26",
                        "cost": 65.0
                    },
                    {
                        "id": 6,
                        "name": "Rehoboth Country Club",
                        "date": "2013-04-27",
                        "cost": 65.0
                    }
                ],
                "golfers": [
                    {
                        "id": 1,
                        "name": "Tony Soprano",
                        "email": "t@badabing.com",
                        "cost": 660.0
                    },
                    {
                        "id": 2,
                        "name": "Paulie Gaultieri",
                        "email": "walnuts@badabing.com",
                        "cost": 365.0
                    }
                ]
            }
        },
        {
            "id": "2",
            "type": "trip",
            "attributes": {
                "year": 2014,
                "number": 14,
                "location": "Rehoboth Beach",
                "nights": [
                    {
                        "id": 8,
                        "date": "2014-04-20",
                        "cost": 0.0
                    },
                    {
                        "id": 9,
                        "date": "2014-04-21",
                        "cost": 80.0
                    },
                    {
                        "id": 10,
                        "date": "2014-04-22",
                        "cost": 80.0
                    },
                    {
                        "id": 11,
                        "date": "2014-04-23",
                        "cost": 80.0
                    },
                    {
                        "id": 12,
                        "date": "2014-04-24",
                        "cost": 80.0
                    },
                    {
                        "id": 13,
                        "date": "2014-04-25",
                        "cost": 80.0
                    },
                    {
                        "id": 14,
                        "date": "2014-04-26",
                        "cost": 80.0
                    }
                ],
                "meals": [
                    {
                        "id": 14,
                        "date": "2014-04-21",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 15,
                        "date": "2014-04-21",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 16,
                        "date": "2014-04-22",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 17,
                        "date": "2014-04-22",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 18,
                        "date": "2014-04-23",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 19,
                        "date": "2014-04-23",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 20,
                        "date": "2014-04-24",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 21,
                        "date": "2014-04-24",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 22,
                        "date": "2014-04-25",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 23,
                        "date": "2014-04-25",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 24,
                        "date": "2014-04-26",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 25,
                        "date": "2014-04-26",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 26,
                        "date": "2014-04-27",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    }
                ],
                "courses": [
                    {
                        "id": 7,
                        "name": "Kings Creek Country Club",
                        "date": "2014-04-21",
                        "cost": 70.0
                    },
                    {
                        "id": 8,
                        "name": "Rehoboth Country Club",
                        "date": "2014-04-22",
                        "cost": 70.0
                    },
                    {
                        "id": 9,
                        "name": "The Salt Pond Golf Club",
                        "date": "2014-04-23",
                        "cost": 70.0
                    },
                    {
                        "id": 10,
                        "name": "American Classic Golf Club",
                        "date": "2014-04-24",
                        "cost": 70.0
                    },
                    {
                        "id": 11,
                        "name": "Kings Creek Country Club",
                        "date": "2014-04-25",
                        "cost": 70.0
                    },
                    {
                        "id": 12,
                        "name": "The Salt Pond Golf Club",
                        "date": "2014-04-26",
                        "cost": 70.0
                    }
                ],
                "golfers": [
                    {
                        "id": 1,
                        "name": "Tony Soprano",
                        "email": "t@badabing.com",
                        "cost": 570.0
                    }
                ]
            }
        },
        {
            "id": "3",
            "type": "trip",
            "attributes": {
                "year": 2015,
                "number": 15,
                "location": "VA Beach",
                "nights": [
                    {
                        "id": 15,
                        "date": "2015-04-19",
                        "cost": 0.0
                    },
                    {
                        "id": 16,
                        "date": "2015-04-20",
                        "cost": 90.0
                    },
                    {
                        "id": 17,
                        "date": "2015-04-21",
                        "cost": 90.0
                    },
                    {
                        "id": 18,
                        "date": "2015-04-22",
                        "cost": 90.0
                    },
                    {
                        "id": 19,
                        "date": "2015-04-23",
                        "cost": 90.0
                    },
                    {
                        "id": 20,
                        "date": "2015-04-24",
                        "cost": 90.0
                    },
                    {
                        "id": 21,
                        "date": "2015-04-25",
                        "cost": 90.0
                    }
                ],
                "meals": [
                    {
                        "id": 27,
                        "date": "2015-04-20",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 28,
                        "date": "2015-04-20",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 29,
                        "date": "2015-04-21",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 30,
                        "date": "2015-04-21",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 31,
                        "date": "2015-04-22",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 32,
                        "date": "2015-04-22",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 33,
                        "date": "2015-04-23",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 34,
                        "date": "2015-04-23",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 35,
                        "date": "2015-04-24",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 36,
                        "date": "2015-04-24",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 37,
                        "date": "2015-04-25",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 38,
                        "date": "2015-04-25",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 39,
                        "date": "2015-04-26",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    }
                ],
                "courses": [
                    {
                        "id": 13,
                        "name": "Red Wing Lake Golf Course",
                        "date": "2015-04-20",
                        "cost": 50.0
                    },
                    {
                        "id": 14,
                        "name": "Virginia Beach National Golf Club",
                        "date": "2015-04-21",
                        "cost": 50.0
                    },
                    {
                        "id": 15,
                        "name": "Hells Point Golf Club",
                        "date": "2015-04-22",
                        "cost": 50.0
                    },
                    {
                        "id": 16,
                        "name": "Heron Ridge Golf Club",
                        "date": "2015-04-23",
                        "cost": 50.0
                    },
                    {
                        "id": 17,
                        "name": "Stumpy Lake Golf Course",
                        "date": "2015-04-24",
                        "cost": 50.0
                    },
                    {
                        "id": 18,
                        "name": "Virginia Beach National Golf Club",
                        "date": "2015-04-25",
                        "cost": 50.0
                    }
                ],
                "golfers": [
                    {
                        "id": 2,
                        "name": "Paulie Gaultieri",
                        "email": "walnuts@badabing.com",
                        "cost": 395.0
                    }
                ]
            }
        },
        {
            "id": "4",
            "type": "trip",
            "attributes": {
                "year": 2016,
                "number": 16,
                "location": "VA Beach",
                "nights": [
                    {
                        "id": 22,
                        "date": "2016-04-24",
                        "cost": 0.0
                    },
                    {
                        "id": 23,
                        "date": "2016-04-25",
                        "cost": 100.0
                    },
                    {
                        "id": 24,
                        "date": "2016-04-26",
                        "cost": 100.0
                    },
                    {
                        "id": 25,
                        "date": "2016-04-27",
                        "cost": 100.0
                    },
                    {
                        "id": 26,
                        "date": "2016-04-28",
                        "cost": 100.0
                    },
                    {
                        "id": 27,
                        "date": "2016-04-29",
                        "cost": 100.0
                    },
                    {
                        "id": 28,
                        "date": "2016-04-30",
                        "cost": 100.0
                    }
                ],
                "meals": [
                    {
                        "id": 40,
                        "date": "2016-04-25",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 41,
                        "date": "2016-04-25",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 42,
                        "date": "2016-04-26",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 43,
                        "date": "2016-04-26",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 44,
                        "date": "2016-04-27",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 45,
                        "date": "2016-04-27",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 46,
                        "date": "2016-04-28",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 47,
                        "date": "2016-04-28",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 48,
                        "date": "2016-04-29",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 49,
                        "date": "2016-04-29",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 50,
                        "date": "2016-04-30",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    },
                    {
                        "id": 51,
                        "date": "2016-04-30",
                        "time_of_day": "dinner",
                        "cost": 5.0
                    },
                    {
                        "id": 52,
                        "date": "2016-05-01",
                        "time_of_day": "breakfast",
                        "cost": 5.0
                    }
                ],
                "courses": [
                    {
                        "id": 19,
                        "name": "Red Wing Lake Golf Course",
                        "date": "2016-04-25",
                        "cost": 60.0
                    },
                    {
                        "id": 20,
                        "name": "Virginia Beach National Golf Club",
                        "date": "2016-04-26",
                        "cost": 60.0
                    },
                    {
                        "id": 21,
                        "name": "Hells Point Golf Club",
                        "date": "2016-04-27",
                        "cost": 60.0
                    },
                    {
                        "id": 22,
                        "name": "Heron Ridge Golf Club",
                        "date": "2016-04-28",
                        "cost": 60.0
                    },
                    {
                        "id": 23,
                        "name": "Stumpy Lake Golf Course",
                        "date": "2016-04-29",
                        "cost": 60.0
                    },
                    {
                        "id": 24,
                        "name": "Red Wing Lake Golf Course",
                        "date": "2016-04-30",
                        "cost": 60.0
                    }
                ],
                "golfers": [
                    {
                        "id": 1,
                        "name": "Tony Soprano",
                        "email": "t@badabing.com",
                        "cost": 1025.0
                    }
                ]
            }
        }
    ]
}
```

### GET /api/v1/trips/:id <a name="get_trip"></a>

This endpoint returns data for the requested trip, including its `year`, `number`, and `location` attributes, along with its `nights`, `meals`, `courses`, and `golfers`. The only required parameter is the the trip `id`, which should be included in the URI. 

Example response: 

```
{
    "data": {
        "id": "1",
        "type": "trip",
        "attributes": {
            "year": 2013,
            "number": 13,
            "location": "Dewey Beach",
            "nights": [
                {
                    "id": 1,
                    "date": "2013-04-21",
                    "cost": 0.0
                },
                {
                    "id": 2,
                    "date": "2013-04-22",
                    "cost": 70.0
                },
                {
                    "id": 3,
                    "date": "2013-04-23",
                    "cost": 70.0
                },
                {
                    "id": 4,
                    "date": "2013-04-24",
                    "cost": 70.0
                },
                {
                    "id": 5,
                    "date": "2013-04-25",
                    "cost": 70.0
                },
                {
                    "id": 6,
                    "date": "2013-04-26",
                    "cost": 70.0
                },
                {
                    "id": 7,
                    "date": "2013-04-27",
                    "cost": 70.0
                }
            ],
            "meals": [
                {
                    "id": 1,
                    "date": "2013-04-22",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                },
                {
                    "id": 2,
                    "date": "2013-04-22",
                    "time_of_day": "dinner",
                    "cost": 5.0
                },
                {
                    "id": 3,
                    "date": "2013-04-23",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                },
                {
                    "id": 4,
                    "date": "2013-04-23",
                    "time_of_day": "dinner",
                    "cost": 5.0
                },
                {
                    "id": 5,
                    "date": "2013-04-24",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                },
                {
                    "id": 6,
                    "date": "2013-04-24",
                    "time_of_day": "dinner",
                    "cost": 5.0
                },
                {
                    "id": 7,
                    "date": "2013-04-25",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                },
                {
                    "id": 8,
                    "date": "2013-04-25",
                    "time_of_day": "dinner",
                    "cost": 5.0
                },
                {
                    "id": 9,
                    "date": "2013-04-26",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                },
                {
                    "id": 10,
                    "date": "2013-04-26",
                    "time_of_day": "dinner",
                    "cost": 5.0
                },
                {
                    "id": 11,
                    "date": "2013-04-27",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                },
                {
                    "id": 12,
                    "date": "2013-04-27",
                    "time_of_day": "dinner",
                    "cost": 5.0
                },
                {
                    "id": 13,
                    "date": "2013-04-28",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                }
            ],
            "courses": [
                {
                    "id": 1,
                    "name": "Kings Creek Country Club",
                    "date": "2013-04-22",
                    "cost": 65.0
                },
                {
                    "id": 2,
                    "name": "Rehoboth Country Club",
                    "date": "2013-04-23",
                    "cost": 65.0
                },
                {
                    "id": 3,
                    "name": "The Salt Pond Golf Club",
                    "date": "2013-04-24",
                    "cost": 65.0
                },
                {
                    "id": 4,
                    "name": "American Classic Golf Club",
                    "date": "2013-04-25",
                    "cost": 65.0
                },
                {
                    "id": 5,
                    "name": "Kings Creek Country Club",
                    "date": "2013-04-26",
                    "cost": 65.0
                },
                {
                    "id": 6,
                    "name": "Rehoboth Country Club",
                    "date": "2013-04-27",
                    "cost": 65.0
                }
            ],
            "golfers": [
                {
                    "id": 1,
                    "name": "Tony Soprano",
                    "email": "t@badabing.com",
                    "cost": 660.0
                },
                {
                    "id": 2,
                    "name": "Paulie Gaultieri",
                    "email": "walnuts@badabing.com",
                    "cost": 365.0
                }
            ]
        }
    }
}
```

### POST /api/v1/trips <a name="create_trip"></a>

This endpoint creates a new trip in the database, including its direct attributes of `year`, `number`, and `location`, as well as all of its dependent relationships: its `trip_courses`, `nights`, and `meals`. Thus, it requires six parameters: `year`, `number`, and `location`, as well as `courses`, which should be an array of hashes, each containing a `course_id`, `date`, and `cost`; it also requires `nights`, which should be an array of hashes, each containing a `date` and `cost`; last, it requires `meals`, which should be an array of hashes, each containing a `date`, `time_of_day` of either `0` for breakfast or `1` for dinner, and `cost`.

Example request: 

```
{
    "year":2017,
    "number":17,
    "location":"VA Beach",
    "courses":[
        {
            "course":5,
            "date":"2017-04-24",
            "cost":65.0
        },
        {
            "course":6,
            "date":"2017-04-25",
            "cost":65.0
        },
        {
            "course":7,
            "date":"2017-04-26",
            "cost":65.0
        },
        {
            "course":8,
            "date":"2017-04-27",
            "cost":65.0
        },
        {
            "course":9,
            "date":"2017-04-28",
            "cost":65.0
        },{
            "course":5,
            "date":"2017-04-29",
            "cost":65.0
        }
    ],
    "nights":[
        {
            "date":"2017-04-23",
            "cost":0.0
        },
        {
            "date":"2017-04-24",
            "cost":90.0
        },
        {
            "date":"2017-04-25",
            "cost":90.0
        },
        {
            "date":"2017-04-26",
            "cost":90.0
        },
        {
            "date":"2017-04-27",
            "cost":90.0
        },
        {
            "date":"2017-04-28",
            "cost":90.0
        },
        {
            "date":"2017-04-29",
            "cost":90.0
        }
    ],
    "meals":[
        {
            "date":"2017-04-24",
            "time_of_day":0,
            "cost":5.0
        },
        {
            "date":"2017-04-24",
            "time_of_day":1,
            "cost":5.0
        },
        {
            "date":"2017-04-25",
            "time_of_day":0,
            "cost":5.0
        },
        {
            "date":"2017-04-25",
            "time_of_day":1,
            "cost":5.0
        },
        {
            "date":"2017-04-26",
            "time_of_day":0,
            "cost":5.0
        },
        {
            "date":"2017-04-26",
            "time_of_day":1,
            "cost":5.0
        },
        {
            "date":"2017-04-27",
            "time_of_day":0,
            "cost":5.0
        },
        {
            "date":"2017-04-27",
            "time_of_day":1,
            "cost":5.0
        },
        {
            "date":"2017-04-28",
            "time_of_day":0,
            "cost":5.0
        },
        {
            "date":"2017-04-28",
            "time_of_day":1,
            "cost":5.0
        },
        {
            "date":"2017-04-29",
            "time_of_day":0,
            "cost":5.0
        },
        {
            "date":"2017-04-29",
            "time_of_day":1,
            "cost":5.0
        },
        {
            "date":"2017-04-30",
            "time_of_day":0,
            "cost":5.0
        }
    ]
}
```

Example response: 

```
{
    "data": {
        "id": "6",
        "type": "trip",
        "attributes": {
            "year": 2017,
            "number": 17,
            "location": "VA Beach",
            "nights": [
                {
                    "id": 29,
                    "date": "2017-04-23",
                    "cost": 0.0
                },
                {
                    "id": 30,
                    "date": "2017-04-24",
                    "cost": 90.0
                },
                {
                    "id": 31,
                    "date": "2017-04-25",
                    "cost": 90.0
                },
                {
                    "id": 32,
                    "date": "2017-04-26",
                    "cost": 90.0
                },
                {
                    "id": 33,
                    "date": "2017-04-27",
                    "cost": 90.0
                },
                {
                    "id": 34,
                    "date": "2017-04-28",
                    "cost": 90.0
                },
                {
                    "id": 35,
                    "date": "2017-04-29",
                    "cost": 90.0
                }
            ],
            "meals": [
                {
                    "id": 53,
                    "date": "2017-04-24",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                },
                {
                    "id": 54,
                    "date": "2017-04-24",
                    "time_of_day": "dinner",
                    "cost": 5.0
                },
                {
                    "id": 55,
                    "date": "2017-04-25",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                },
                {
                    "id": 56,
                    "date": "2017-04-25",
                    "time_of_day": "dinner",
                    "cost": 5.0
                },
                {
                    "id": 57,
                    "date": "2017-04-26",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                },
                {
                    "id": 58,
                    "date": "2017-04-26",
                    "time_of_day": "dinner",
                    "cost": 5.0
                },
                {
                    "id": 59,
                    "date": "2017-04-27",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                },
                {
                    "id": 60,
                    "date": "2017-04-27",
                    "time_of_day": "dinner",
                    "cost": 5.0
                },
                {
                    "id": 61,
                    "date": "2017-04-28",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                },
                {
                    "id": 62,
                    "date": "2017-04-28",
                    "time_of_day": "dinner",
                    "cost": 5.0
                },
                {
                    "id": 63,
                    "date": "2017-04-29",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                },
                {
                    "id": 64,
                    "date": "2017-04-29",
                    "time_of_day": "dinner",
                    "cost": 5.0
                },
                {
                    "id": 65,
                    "date": "2017-04-30",
                    "time_of_day": "breakfast",
                    "cost": 5.0
                }
            ],
            "courses": [
                {
                    "id": 25,
                    "name": "Red Wing Lake Golf Course",
                    "date": "2017-04-24",
                    "cost": 65.0
                },
                {
                    "id": 26,
                    "name": "Virginia Beach National Golf Club",
                    "date": "2017-04-25",
                    "cost": 65.0
                },
                {
                    "id": 27,
                    "name": "Hells Point Golf Club",
                    "date": "2017-04-26",
                    "cost": 65.0
                },
                {
                    "id": 28,
                    "name": "Heron Ridge Golf Club",
                    "date": "2017-04-27",
                    "cost": 65.0
                },
                {
                    "id": 29,
                    "name": "Stumpy Lake Golf Course",
                    "date": "2017-04-28",
                    "cost": 65.0
                },
                {
                    "id": 30,
                    "name": "Red Wing Lake Golf Course",
                    "date": "2017-04-29",
                    "cost": 65.0
                }
            ],
            "golfers": []
        }
    }
}
```

### GET /api/v1/courses <a name="get_courses"></a>

This endpoint returns all of the courses in the database, including their `name`, `address`, `city`, `state`, and `zipcode` attributes. No parameters are required. 

```
{
    "data": [
        {
            "id": "1",
            "type": "course",
            "attributes": {
                "name": "Kings Creek Country Club",
                "address": "1 Kings Creek Cir",
                "city": "Rehoboth Beach",
                "state": "DE",
                "zipcode": "19971"
            }
        },
        {
            "id": "2",
            "type": "course",
            "attributes": {
                "name": "Rehoboth Country Club",
                "address": "221 West Side Dr",
                "city": "Rehoboth Beach",
                "state": "DE",
                "zipcode": "19971"
            }
        },
        {
            "id": "3",
            "type": "course",
            "attributes": {
                "name": "The Salt Pond Golf Club",
                "address": "402 Bethany Loop",
                "city": "Bethany Beach",
                "state": "DE",
                "zipcode": "19930"
            }
        },
        {
            "id": "4",
            "type": "course",
            "attributes": {
                "name": "American Classic Golf Club",
                "address": "18485 Bethpage Dr",
                "city": "Lewes",
                "state": "DE",
                "zipcode": "19958"
            }
        },
        {
            "id": "5",
            "type": "course",
            "attributes": {
                "name": "Red Wing Lake Golf Course",
                "address": "1144 Prosperity Rd",
                "city": "Virginia Beach",
                "state": "VA",
                "zipcode": "23451"
            }
        },
        {
            "id": "6",
            "type": "course",
            "attributes": {
                "name": "Virginia Beach National Golf Club",
                "address": "2500 Tournament Dr",
                "city": "Virginia Beach",
                "state": "VA",
                "zipcode": "23456"
            }
        },
        {
            "id": "7",
            "type": "course",
            "attributes": {
                "name": "Hells Point Golf Club",
                "address": "2700 Atwoodtown Rd",
                "city": "Virginia Beach",
                "state": "VA",
                "zipcode": "23456"
            }
        },
        {
            "id": "8",
            "type": "course",
            "attributes": {
                "name": "Heron Ridge Golf Club",
                "address": "2973 Heron Ridge Dr",
                "city": "Virginia Beach",
                "state": "VA",
                "zipcode": "23456"
            }
        },
        {
            "id": "9",
            "type": "course",
            "attributes": {
                "name": "Stumpy Lake Golf Course",
                "address": "4797 Indian River Rd",
                "city": "Virginia Beach",
                "state": "VA",
                "zipcode": "23456"
            }
        }
    ]
}
```

### POST /api/v1/courses <a name="create_course"></a>

This endpoint creates a new Course in the database and returns serialized json for the new course including all of its attributes. The required parameters are `name`, `address`, `city`, `state`, and `zipcode`. 

Example request: 

```
{
    "name":"Gauntlet Golf Club",
    "address":"18 Fairway Dr",
    "city":"Fredericksburg",
    "state":"VA",
    "zipcode":"22406"
}
```

Example response: 

```
{
    "data": {
        "id": "10",
        "type": "course",
        "attributes": {
            "name": "Gauntlet Golf Club",
            "address": "18 Fairway Dr",
            "city": "Fredericksburg",
            "state": "VA",
            "zipcode": "22406"
        }
    }
}
```
