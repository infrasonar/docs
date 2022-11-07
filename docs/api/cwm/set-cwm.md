# Set ConnectWise Manage
**`POST` /container/<containerId\>/set-cwm**

### Description
This API call can be used to create a mapping between a ConnectWise Manage company Id and an InfraSonar container.
The ConnectWise Manage add-on is required, contact [InfraSonar](https://infrasonar.com/support) for more information.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Body
Param       | Type          | Required  | Description
------------|---------------|-----------|-------------
`companyId` | integer/null  | Yes       | Company Id used by ConnectWise Manage to link to the container. If `null`, CWM will be _disabled_ for the container.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CONTAINER_MANAGEMENT`)_.
`404`       | Container not found.
`409`       | ConnectWise Manage add-on is not available for the container.

### Example
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/container/123/set-cwm-company' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "companyId": 123
}'
```
