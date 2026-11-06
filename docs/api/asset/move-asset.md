# Move asset
**`POST`  /asset/<assetId\>/move**

### Description
Move asset to another container.

!!! warning
    It may happen that the asset has collectors that are not currently enabled in the destination container. These collectors will still be assigned to the assets, but you may need to take the following actions after the move has completed:

    - Enable the necessary collectors within the destination container.
    - For probe collectors: Ensure the appliance has the required probe collector installed.

!!! warning
    Please note that if the target container operates in a different time zone, this time zone difference may impact scheduled events and cause adjusted times to be displayed in asset data.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.

### Query parameters
_none_

### Body
Param               | Type      | Required  | Description
--------------------|-----------|-----------|-------------
`targetContainerId` | integer   | Yes       | Target container Id.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400` 	    | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ASSET_MANAGEMENT`)_.
`404`       | Asset not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/asset/123/move' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    --data-raw '{
    "targetContainerId": 100
}'
```
