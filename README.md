# LaundryBox API v1 Resources



## Sign Up ##

- Return the newly created User object
- URL: POST /api/v1/sign_up.json

Query Params:
*  **email**  : 
	*	required  
*  **password** :
    * required
*  **password_confirmation** :
    * required

Response example :

```javascript
{
	"malls": [{
			"id": 1,
		        "name": "*Scape",
		        "sl_mall_id": "",
		        "address": "2 Orchard Link",
		        "latitude": 1.30087,
		        "longitude": 103.835,
		        "zip": "237978",
		        "url": "www.scape.com.sg",
		        "phone": " 6521 6565",
		        "contain_carpark": false,
		        "updated_time": 1351848429
		 },
		 {
		        "id": 320,
		        "name": "Yew Tee Square",
		        "sl_mall_id":"4ccaef4d-6c3b-4cbe-b44e-76379979a255",
		        "address": "622 Choa Chu Kang Street 62",
		        "latitude": 1.39803,
		        "longitude": 103.747,
		        "zip": "680622",
		        "url": "http://www.hdb.gov.sg/fi1/fi133p.nsf/w/ShopperNeighbourhoodComplex23?OpenDocument",
		        "phone": ""
		        "contain_carpark": false,
		        "updated_time": 1351848429
		        }
		    ]
		}
```	
	

## Sign In ##

- logs in user
- Returns the user object along with the secure token for the user and the time of expiry of the secury token
- URL: POST /api/sign_in.json

Query Params:	
*  **email**  : 
	*	required
*  **password**  : 
	*	required

Response example :

```javascript
{
    "user": {
        "email_address": "admin@mail.com",
        "secure_token": "vqB1KHDnMoDWj8e6iAcYYA",
        "token_expire": "2014-01-03T10:20:55.666Z"
    }
}
```

## Sign Out ##

- signs out user and deletes the secure token
- URL: GET /api/sign_out.json

Query Params:
- secure_token 

Response Example:

```javascript
{
    "message": {
        "message": "User Sign Out"
    }
}
```

## Create new Order ##

- Create a new Laundry Order
- URL: POST /api/v1/orders.json

Query Params (all params are mandatory):
- order => item_ids (array), status(string), special_message(optional)  
- secure_token

Response Example:

```javascript
{
    "order": {
        "id": 10,
        "cost": "20.0",
        "status": "AWAITING_COLLECTION",
        "message": "handwash only"
    },
    "items": [{
        "id": 2,
        "name": "Shirt",
        "cost": "5.0"
    }, {
        "id": 3,
        "name": "Pant",
        "cost": "5.0"
    }, {
        "id": 4,
        "name": "pyjamas",
        "cost": "10.0"
    }]
}
```




## Get List of Items ##

- Remark: Returns a list of items which can be given
- URL: GET /api/v1/admin/items.json

Query Params:
*  **secure_token**  
	
Response example :

```javascript
{
    "items": [{
        "id": 1,
        "name": "Shirt",
        "cost": "5.0"
    }, {
        "id": 2,
        "name": "Shirt",
        "cost": "5.0"
    }, {
        "id": 3,
        "name": "Pant",
        "cost": "5.0"
    }, {
        "id": 4,
        "name": "pyjamas",
        "cost": "10.0"
    }]
}
```

## Update Order ##

- URL: PUT /api/v1/orders/:id.json

Query Params:
*  order => special_message, status, items

Response example :

```javascript
{
    "order": {
        "id": 10,
        "cost": "20.0",
        "status": "PENDING_PAYMENT",
        "message": "handwash only"
    },
    "items": [{
        "id": 2,
        "name": "Shirt",
        "cost": "5.0"
    }, {
        "id": 3,
        "name": "Pant",
        "cost": "5.0"
    }, {
        "id": 4,
        "name": "pyjamas",
        "cost": "10.0"
    }]
}
```

## Get All Orders ##

- URL: PUT /api/v1/orders.json

Query Params:
*  secure_token

Response example :

```javascript
{
    "orders": [{
        "id": 1,
        "cost": "0.0",
        "status": "AWAITING_COLLECTION"
    }, {
        "id": 2,
        "cost": "0.0",
        "status": "AWAITING_COLLECTION"
    }, {
        "id": 3,
        "cost": "0.0",
        "status": "AWAITING_COLLECTION"
    }, {
        "id": 4,
        "cost": "0.0",
        "status": "PENDING_PAYMENT"
    }, {
        "id": 5,
        "cost": "25.0",
        "status": "AWAITING_COLLECTION"
    }, {
        "id": 7,
        "cost": "20.0",
        "status": "AWAITING_COLLECTION"
    }, {
        "id": 8,
        "cost": "20.0",
        "status": "PENDING_PAYMENT"
    }]
}
```

## Get Reciept for an Order ##

- URL: GET /api/v1/orders/:order_id/get_reciept

Query Params:
* secure_token

Response example :

```javascript
{
    "order": {
        "id": 8,
        "cost": "20.0",
        "status": "PENDING_PAYMENT"
    },
    "items": [{
        "id": 2,
        "name": "Shirt",
        "cost": "5.0"
    }, {
        "id": 3,
        "name": "Pant",
        "cost": "5.0"
    }, {
        "id": 4,
        "name": "pyjamas",
        "cost": "10.0"
    }]
}
``` 

## Create an Item ##

- URL: POST /api/v1/admin/items.json

Query Params:
* item => name,cost(deciaml)
* secure_token (ADMIN ONLY)


Response example :

```javascript
{
    "item": {
        "id": 6,
        "name": "poncho",
        "cost": "14.0"
    }
}
```	

