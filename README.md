# KPC - Back End

## Overview

KPC is an app used for management of the world's most glorious golf outing, the Kitchen Pass Classic, which I have had the good fortune of attending with my Father and all of his best buddies since I was a Senior in High School, and which all of my best buddies have begun attending since around the same time. 

This is the documentation for the Back End app, which is an API written in Ruby on Rails (Ruby Version 2.7.4 / Rails Version 5.2.8). It contains the PostgreSQL relational database and exposes endpoints generating serialized JSON for use on the Front End. 

## Database Schema 

<img width="1419" alt="image" src="https://user-images.githubusercontent.com/93609855/212140683-f1b63ad7-99eb-426f-8611-aebfc87043d5.png">

## Endpoints

### Golfers 

`POST /api/v1/golfers`

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
            "password_digest": "$2a$12$8awj7YzMutevOQ67MU.nzOv63xgVC5nyfR3G05lI/b5pxRYuEqMoW"
        }
    }
}
```



