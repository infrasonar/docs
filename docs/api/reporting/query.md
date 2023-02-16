# Query reporting
**`GET`/reporting/<reportingId\>?fields=...**

### Description
Query reporting details.

### Path parameters
Param               | Description
--------------------|-------------
`reportingId`       | Reporting Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see fields below for all available fields)_.
`reports`           | _none_            | Report fields. If at least one field is given, the result will include "_reports_" with an array of _report_ objects _(see Reports below for all available report fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`id`                | int           | Reporting Id.
`name`              | string        | Reporting name.
`kind`              | string        | One of `AlertsNotificationsReport`, `StateDataReport`, `ChartDataReport`, `ConditionReport`.
`content`           | string        | One of `PDF`, `JSON`, `XLSX`.
`repeat`            | string/null   | One of `Daily`, `Weekly`, `Monthly` or `null` when this is a one-time reporting.

### Reports
Field               | Return type   | Description
--------------------|---------------|-------------
`id`                | int           | Report Id.
`size`              | int           | Report size in bytes.
`start`             | string        | Start time of the report. For example, a monthly report for March 2023 will return `2023-03-01T00:00:00+0100`.
`success`           | bool          | This is `true` if the report was successful, else `false`.


### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`REPORTING_VIEW`)_.
`404`       | Reporting not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/reporting/123?fields=name,kind&reports=id,start' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "name": "My report",
    "kind": "StateDataReport",
    "reports": [
        {
            "id": 123,
            "start": "2023-03-01T00:00:00+0100"
        }
    ]
}
```
