# Remove container
**`DELETE` /container/<containerId\>**

### Description
Remove a container. Only _"empty" (no assets or child containers etc.)_ containers  can be removed. If not empty, a `HTTP 400` error will be returned with the reason.

Please be advised that `CONTAINER_MANAGEMENT` and `API` access privileges are requisite for the **parent container**.
When using a container token, it is essential that the token has been generated for the parent container.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Failed to remove the container. Most likely the container is not empty.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CONTAINER_MANAGEMENT` on the parent container)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X DELETE 'https://api.infrasonar.com/container/456' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```
