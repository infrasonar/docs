# Query container permissions
**`GET` /container/<containerId\>/permissions**

### Description
Query the token permissions for the given container ID. Returns with authentication flags and the type token which is used.


### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field or invalid query param.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CONTAINER_ACCESS`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/container/123/permissions' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "permissions": [
        "API",
        "ASSET_MANAGEMENT",
        "CHECK_MANAGEMENT",
        "CONTAINER_ADMIN",
        "CONTAINER_MANAGEMENT",
        "READ"
    ],
    "tokenType": "user"
}
```
