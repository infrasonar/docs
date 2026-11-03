# Query token permissions
**`GET` /permissions**

### Description
Query the token permissions. Returns authentication flags per container and the token type. Only containers where the token has at least `API` + `READ` permissions are included.

The `tokenType` field indicates whether the token is associated with a `user` or a `container`.

An empty `containers` list indicates the token has no containers with `API` + `READ` permissions.

### Path parameters
_none_

### Query parameters
_none_

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field or invalid query param.
`401`       | Invalid or missing token.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/permissions' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "containers": [
        {
            "name": "MyContainer",
            "id": 123,
            "permissions": [
                "API",
                "ASSET_MANAGEMENT",
                "CHECK_MANAGEMENT",
                "CONTAINER_ADMIN",
                "CONTAINER_MANAGEMENT",
                "READ"
            ],
        }
    ],
    "tokenType": "container"
}
```
