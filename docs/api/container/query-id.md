# Query container Id
**`GET` /container/id**

### Description
Query a container Id by token. This route _only_ works with a container token.

### Path parameters
_none_

### Query parameters
_none_

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`)_.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/container/id' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "containerId": 123
}
```
