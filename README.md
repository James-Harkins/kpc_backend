# KPC - Back End

## Overview

KPC is an app used for management of the world's most glorious golf outing, the Kitchen Pass Classic, which I have had the good fortune of attending with my Father and all of his best buddies since I was a Senior in High School, and which all of my best buddies have begun attending since around the same time. 

This is the documentation for the Back End app, which is an API written in Ruby on Rails (Ruby Version 2.7.4 / Rails Version 5.2.8). It contains the PostgreSQL relational database and exposes endpoints generating serialized JSON responses or use on the Front End. 

## Database Schema 

<img width="1419" alt="image" src="https://user-images.githubusercontent.com/93609855/212140683-f1b63ad7-99eb-426f-8611-aebfc87043d5.png">

## Endpoints

1. [POST /api/v1/golfers](#create_golfer)
2. [POST /api/v1/sessions](#crete_session)
3. [GET /golfer/:id/golfer_trips](#get_golfer_trips)
4. [GET /golfer/:golfer_id/golfer_trips/:trip_id](#get_golfer_trip)
5. [POST /golfer/:id/golfer_trips](#create_golfer_trip)
6. [GET /trips](#get_trips)
7. [GET /trips/:id](#get_trip)
8. [POST /trips](#create_trip)

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

### GET /golfers/:golfer_id/golfer_trips <a name="get_golfer_trips"></a>

This endpoint returns data for each trip that a given golfer has attended, including the total cost of the trip to the golfer, all the nights he stayed in the house, all the meals he ate, and all the courses he played. The only parameter that needs to be passed back for this endpoint is the `golfer_id`.

Example request:

```
{
    "golfer_id": 1
}
```

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
                    "2013-04-23",
                    "2013-04-24",
                    "2013-04-25",
                    "2013-04-26",
                    "2013-04-27"
                ],
                "meals": [
                    {
                        "2013-04-23": "dinner"
                    },
                    {
                        "2013-04-24": "breakfast"
                    },
                    {
                        "2013-04-24": "dinner"
                    },
                    {
                        "2013-04-25": "breakfast"
                    },
                    {
                        "2013-04-25": "dinner"
                    },
                    {
                        "2013-04-26": "breakfast"
                    },
                    {
                        "2013-04-26": "dinner"
                    },
                    {
                        "2013-04-27": "breakfast"
                    },
                    {
                        "2013-04-27": "dinner"
                    },
                    {
                        "2013-04-28": "breakfast"
                    }
                ],
                "courses": [
                    {
                        "date": "2013-04-24",
                        "name": "The Salt Pond Golf Club",
                        "address": "402 Bethany Loop",
                        "city": "Bethany Beach",
                        "state": "DE",
                        "zip": "19930"
                    },
                    {
                        "date": "2013-04-25",
                        "name": "American Classic Golf Club",
                        "address": "18485 Bethpage Dr",
                        "city": "Lewes",
                        "state": "DE",
                        "zip": "19958"
                    },
                    {
                        "date": "2013-04-26",
                        "name": "Kings Creek Country Club",
                        "address": "1 Kings Creek Cir",
                        "city": "Rehoboth Beach",
                        "state": "DE",
                        "zip": "19971"
                    },
                    {
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
                    "2014-04-23",
                    "2014-04-24",
                    "2014-04-25",
                    "2014-04-26"
                ],
                "meals": [
                    {
                        "2014-04-23": "dinner"
                    },
                    {
                        "2014-04-24": "breakfast"
                    },
                    {
                        "2014-04-24": "dinner"
                    },
                    {
                        "2014-04-25": "breakfast"
                    },
                    {
                        "2014-04-25": "dinner"
                    },
                    {
                        "2014-04-26": "breakfast"
                    },
                    {
                        "2014-04-26": "dinner"
                    },
                    {
                        "2014-04-27": "breakfast"
                    }
                ],
                "courses": [
                    {
                        "date": "2014-04-24",
                        "name": "American Classic Golf Club",
                        "address": "18485 Bethpage Dr",
                        "city": "Lewes",
                        "state": "DE",
                        "zip": "19958"
                    },
                    {
                        "date": "2014-04-25",
                        "name": "Kings Creek Country Club",
                        "address": "1 Kings Creek Cir",
                        "city": "Rehoboth Beach",
                        "state": "DE",
                        "zip": "19971"
                    },
                    {
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
                    "2016-04-24",
                    "2016-04-25",
                    "2016-04-26",
                    "2016-04-27",
                    "2016-04-28",
                    "2016-04-29",
                    "2016-04-30"
                ],
                "meals": [
                    {
                        "2016-04-25": "breakfast"
                    },
                    {
                        "2016-04-25": "dinner"
                    },
                    {
                        "2016-04-26": "breakfast"
                    },
                    {
                        "2016-04-26": "dinner"
                    },
                    {
                        "2016-04-27": "breakfast"
                    },
                    {
                        "2016-04-27": "dinner"
                    },
                    {
                        "2016-04-28": "breakfast"
                    },
                    {
                        "2016-04-28": "dinner"
                    },
                    {
                        "2016-04-29": "breakfast"
                    },
                    {
                        "2016-04-29": "dinner"
                    },
                    {
                        "2016-04-30": "breakfast"
                    },
                    {
                        "2016-04-30": "dinner"
                    },
                    {
                        "2016-05-01": "breakfast"
                    }
                ],
                "courses": [
                    {
                        "date": "2016-04-25",
                        "name": "Red Wing Lake Golf Course",
                        "address": "1144 Prosperity Rd",
                        "city": "Virginia Beach",
                        "state": "VA",
                        "zip": "23451"
                    },
                    {
                        "date": "2016-04-26",
                        "name": "Virginia Beach National Golf Club",
                        "address": "2500 Tournament Dr",
                        "city": "Virginia Beach",
                        "state": "VA",
                        "zip": "23456"
                    },
                    {
                        "date": "2016-04-27",
                        "name": "Hells Point Golf Club",
                        "address": "2700 Atwoodtown Rd",
                        "city": "Virginia Beach",
                        "state": "VA",
                        "zip": "23456"
                    },
                    {
                        "date": "2016-04-28",
                        "name": "Heron Ridge Golf Club",
                        "address": "2973 Heron Ridge Dr",
                        "city": "Virginia Beach",
                        "state": "VA",
                        "zip": "23456"
                    },
                    {
                        "date": "2016-04-29",
                        "name": "Stumpy Lake Golf Course",
                        "address": "4797 Indian River Rd",
                        "city": "Virginia Beach",
                        "state": "VA",
                        "zip": "23456"
                    },
                    {
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

### GET /golfers/:golfer_id/golfer_trips/:trip_id <a name="get_golfer_trip"></a>

This endpoint returns data for a given trip that a given golfer has attended, including the total cost of the trip to the golfer, all the nights he stayed in the house, all the meals he ate, and all the courses he played. The only parameters that need to be passed back for this endpoint are the `golfer_id` and the `trip_id`.

Example request:

```
{
    "golfer_id": 1,
    "trip_id": 4
}
```

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
                "2016-04-24",
                "2016-04-25",
                "2016-04-26",
                "2016-04-27",
                "2016-04-28",
                "2016-04-29",
                "2016-04-30"
            ],
            "meals": [
                {
                    "2016-04-25": "breakfast"
                },
                {
                    "2016-04-25": "dinner"
                },
                {
                    "2016-04-26": "breakfast"
                },
                {
                    "2016-04-26": "dinner"
                },
                {
                    "2016-04-27": "breakfast"
                },
                {
                    "2016-04-27": "dinner"
                },
                {
                    "2016-04-28": "breakfast"
                },
                {
                    "2016-04-28": "dinner"
                },
                {
                    "2016-04-29": "breakfast"
                },
                {
                    "2016-04-29": "dinner"
                },
                {
                    "2016-04-30": "breakfast"
                },
                {
                    "2016-04-30": "dinner"
                },
                {
                    "2016-05-01": "breakfast"
                }
            ],
            "courses": [
                {
                    "date": "2016-04-25",
                    "name": "Red Wing Lake Golf Course",
                    "address": "1144 Prosperity Rd",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23451"
                },
                {
                    "date": "2016-04-26",
                    "name": "Virginia Beach National Golf Club",
                    "address": "2500 Tournament Dr",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23456"
                },
                {
                    "date": "2016-04-27",
                    "name": "Hells Point Golf Club",
                    "address": "2700 Atwoodtown Rd",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23456"
                },
                {
                    "date": "2016-04-28",
                    "name": "Heron Ridge Golf Club",
                    "address": "2973 Heron Ridge Dr",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23456"
                },
                {
                    "date": "2016-04-29",
                    "name": "Stumpy Lake Golf Course",
                    "address": "4797 Indian River Rd",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23456"
                },
                {
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

### POST /golfers/:golfer_id/golfer_trips <a name="create_golfer_trip"></a>

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
                "2016-04-27",
                "2016-04-28",
                "2016-04-29",
                "2016-04-30"
            ],
            "meals": [
                {
                    "2016-04-27": "dinner"
                },
                {
                    "2016-04-28": "breakfast"
                },
                {
                    "2016-04-28": "dinner"
                },
                {
                    "2016-04-29": "breakfast"
                },
                {
                    "2016-04-29": "dinner"
                },
                {
                    "2016-04-30": "breakfast"
                },
                {
                    "2016-04-30": "dinner"
                },
                {
                    "2016-05-01": "breakfast"
                }
            ],
            "courses": [
                {
                    "date": "2016-04-28",
                    "name": "Heron Ridge Golf Club",
                    "address": "2973 Heron Ridge Dr",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23456"
                },
                {
                    "date": "2016-04-29",
                    "name": "Stumpy Lake Golf Course",
                    "address": "4797 Indian River Rd",
                    "city": "Virginia Beach",
                    "state": "VA",
                    "zip": "23456"
                },
                {
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


### GET /trips <a name="get_trips"></a>

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

### GET /trips/:id <a name="get_trip"></a>

This endpoint returns data for the requested trip, including its `year`, `number`, and `location` attributes, along with its `nights`, `meals`, `courses`, and `golfers`. It only requires the trip `id` to be passed in as a query param. 

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

### POST /trips <a name="create_trip"></a>

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
