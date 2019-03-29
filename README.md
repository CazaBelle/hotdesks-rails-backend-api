Hotdesks-backend (RESTful json api)
----------
This is an API backend for a nomad-list styled app. It is currently deployed at: [https://hotdesks-backend-api.herokuapp.com](https://hotdesks-backend-api.herokuapp.com)

API docs
--------
Each of these API endpoints are demonstrated by a curl command that is intended to be pasted into the terminal or used to connect your frontend with the backend
- using the `v` flag to curl with get you addition information

Spaces
------
#### GET `/v1/spaces`
Returns a list of all of the available co-working spaces
```
curl "https://hotdesks-backend-api.herokuapp.com/v1/spaces"
```
The successful JSON response will be structured like this: 
```
[
  {
    id: 1,
    name: "Club Workspace",
    city: "London",
    address: "31 Clerkenwell Close, Farringdon",
    postcode: "EC1R 0AT",
    price: 50,
    created_at: "2019-03-29T15:10:31.797Z",
    updated_at: "2019-03-29T15:10:31.797Z"
  },
  {
    id: 2,
    name: "Google Campus",
    city: "London",
    address: "4-5 Bonhill Street",
    postcode: "EC2A 4BX",
    price: 0,
    created_at: "2019-03-29T15:27:53.093Z",
    updated_at: "2019-03-29T15:27:53.093Z"
  }
]
```
#### POST `/v1/spaces`
This endpoint will allow the user to enter a new co_working space 
```
curl "https://hotdesks-backend-api.herokuapp.com/v1/spaces"
  -X POST\
  -H "Content-Type: application/json
  -d { "name": "WeWork", "address": "Aldgate Tower, 2 Leman St, Whitechapel", "city": "London", "postcode": "E1 8FA",       "price":100}
```
The successful JSON response will be structured like 
```
{
    "message": "Space successfully added",
    "data": {
        "id": 3,
        "name": "WeWork",
        "city": "London",
        "address": "Aldgate Tower, 2 Leman St, Whitechapel",
        "postcode": "E1 8FA",
        "price": 100,
        "created_at": "2019-03-29T15:54:46.514Z",
        "updated_at": "2019-03-29T15:54:46.514Z"
    }
}
```
#### GET `/v1/spaces/:id`
Returns a single space
```
curl "https://hotdesks-backend-api.herokuapp.com/v1/spaces/1"
```
The successful JSON response will be structured like this: 
```
{
    "id": 1,
    "name": "Club Workspace",
    "city": "London",
    "address": "31 Clerkenwell Close, Farringdon",
    "postcode": "EC1R 0AT",
    "price": 50,
    "created_at": "2019-03-29T15:10:31.797Z",
    "updated_at": "2019-03-29T15:10:31.797Z"
}
```
#### PUT `/v1/spaces/:id`
Edits a selected space
```
curl "https://hotdesks-backend-api.herokuapp.com/v1/spaces/1 \
-X PUT \
-H "Content-Type: application/json" \
-d {"name":"New Google Campus"}
```
The above command returns a `204: No Content` response on success.

#### DELETE `/v1/spaces/:id`
Deletes a space 
```
curl "https://hotdesks-backend-api.herokuapp.com/v1/spaces/2"
  -X DELETE \ 
```
The above command returns a `204: No Content` response on success.



