# KPC - Back End

## Overview

KPC is an app used for management of the world's most glorious golf outing, the Kitchen Pass Classic, which I have had the good fortune of attending with my Father and all of his best buddies since I was a Senior in High School, and which all of my best buddies have begun attending since around the same time. 

This is the documentation for the Back End app, which is an API written in Ruby on Rails (Ruby Version 2.7.4 / Rails Version 5.2.8). It contains the PostgreSQL relational database and exposes endpoints generating serialized JSON responses or use on the Front End. 

## Database Schema 

<img width="1419" alt="image" src="https://user-images.githubusercontent.com/93609855/212140683-f1b63ad7-99eb-426f-8611-aebfc87043d5.png">

## Endpoints

### POST /api/v1/golfers

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

### POST /api/v1/sessions

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

### GET /golfers/:golfer_id/golfer_trips

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

### GET /golfers/:golfer_id/golfer_trips/:trip_id

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

### POST /golfers/:golfer_id/golfer_trips

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
