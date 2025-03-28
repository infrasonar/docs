# Remove property
**`DELETE` /container/<containerId\>/properties/<targetId\>/<key\>**

### Description
Remove a property. Returns `204` even if the property did not exist.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.
`targetId`          | Target Id.
`key`               | Property to remove.

### Query parameters
_none_

### Body
_none_

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ASSET_MANAGEMENT`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X DELETE 'https://api.infrasonar.com/container/123/properties/456/my_prop' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```
