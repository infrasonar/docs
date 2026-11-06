# Get timezones
**`GET` /timezones**

### Description
Returns a list of supported time zone strings.

### Path parameters
_none_

### Query parameters
_none_

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/timezones' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
["UTC", "Europe/Amsterdam", "Africa/Abidjan", "Africa/Accra", "..."]
```
