# Query asset Id
**`GET` /asset/id/<assetName\>?containerId=...**

### Description
Query an asset Id by name. Query param _containerId_ is required when using a _user-token_ for authentication. When using a _container-token_, the containerId is _not_ required.

> Note: Removed assets _(assets in trash)_ are ignored and will _not_ be found using this API call.

### Path parameters

Param               | Description
--------------------|-------------
`assetName`         | Asset name.

### Query parameters

Param               | Default           | Description
--------------------|-------------------|-------------
`containerId`       | _none_            | Only required with a _user-token_, for example: containerId=123.

### Return codes

Error code  | Reason
------------|--------
`200`       | Success.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`)_.
`404`       | No asset with the given name is found in the container or the given container is not found.
`409`       | Multiple assets with the same name are found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/asset/id/my-asset.local' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "assetId": 123
}
```
