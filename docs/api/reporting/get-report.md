# Download a report
**`GET`/reporting/<reportingId\>/report/<reportId>**

### Description
Download a report.

### Path parameters
Param               | Description
--------------------|-------------
`reportingId`       | Reporting Id.
`reportId`          | Report Id. _(can be found with using the [reporting](./query.md) API)_.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`REPORTING_VIEW`)_.
`404`       | Reporting not found.
`XXX`       | Other errors may occur when the report is not available for download.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/reporting/123/report/123' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

The result might ba a _PDF_, _XLSX_ or _JSON_ file, depending on the report type.