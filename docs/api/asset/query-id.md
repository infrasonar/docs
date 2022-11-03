# Query asset Id
**`GET` /asset/<assetName\>/id**

### Description
Query an asset Id by name. This route _only_ works with a container token.

> Removed assets _(assets in trash)_ are ignored and will _not_ be found using this API call.

### Path parameters

Param               | Description
--------------------|-------------
`assetName`         | Asset name.

### Query parameters

_none_

### Return codes

Error code  | Reason
------------|--------
`200`       | Success.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`)_.
`404`       | No asset with the given name is found in the container.
`409`       | Multiple assets with the same name are found within the container.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/asset/my-asset.local/id' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "assetId": 123
}
```
