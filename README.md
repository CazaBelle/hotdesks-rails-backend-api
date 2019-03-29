Hotdesks-backend (RESTful json api)
----------
This is an API backend for a nomad-list like app. It is currently deployed at: `insert deployment`

API docs
--------
Each of these API endpoints are demonstrated by a curl command that is intended to be pasted into the terminal or used to connect your frontend with the backend....
* using the `v` flag to curl with get you addition information

Spaces
------
#### GET `/v1/spaces`
Returns a list of all of the available co-working spaces
```
curl "http://heroku
```
The successful JSON response will be structured like this: 
```
[
  "name":etc
]
```
#### POST `\v1\spaces`
This endpoint will allow the user to enter a new co_working space 
```
curl "etc"
```
The successful JSON response will be structured like 
```
{
  stuff here 
}
```
#### GET `\v1\spaces\:id`
Returns the selected space 
```
curl example 
```
JSON reponse
```
```
#### PUT `\v1\spaces\:id`
Allows a specific space to be updated 
```
curl
```
JSON
```
```




Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
