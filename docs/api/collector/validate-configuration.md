# Validate collector configuration
**`POST` /collector/{collectorKey}**

### Description
Validates whether a provided configuration payload adheres to the schema and requirements of the specified collector without applying any changes or initiating monitoring actions.

This dry-run endpoint is useful for pre-flight validation in custom tooling, automation scripts, and integration services (such as MCP servers) before persisting changes.

### Path parameters

Parameter       | Description
----------------|----------------------------------------------------
`collectorKey`  | Collector key.

### Request body

Field      | Type            | Required | Description
-----------|-----------------|----------|-------------
`config`   | object/null     | Optional | Collector-specific settings dictionary. Pass `null`, `{}` (empty object), or omit entirely if validating a collector requiring no configuration.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success (configuration is valid).
`400`       | Invalid (configuration failed validation checks).
`404`       | Collector not found.

### Example
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/collector/wmi' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "config": {
        "address": "mywindows.local",
        "authentication": "Kerberos",
        "exclude_shadow_storage": true
    }
}'
```