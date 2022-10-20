# `POST` /api/hosts

## Description

Query for hosts.

## Arguments

| key              | value            | description                                                        |
| ---------------- | ---------------- | ------------------------------------------------------------------ |
| environmentUuids | array (required) | An array with environment uuids.                                   |
| columns          | array (required) | An array with host properties. See "Columns" for more information. |
| withLabel	       | array (optional)	| List with label key strings. Only hosts with at least one of the given labels assigned will be returned. When `null` or omitted, labels on a host are ignored.  |
| withProbe	       | array (optional)	| List with probe names. Only hosts with at least one of the given probes assigned will be returned. When `null` or omitted, probes on a host are ignored.        |


## Columns

| key         | description                                      |
| ----------- | ------------------------------------------------ |
| hostUuid    | The host uuid.                                   |
| parentUuid  | The parent uuid.                                 |
| address     | The host address.                                |
| name        | The name of the host which is used in Oversight. |
| description | The host description.                            |
| labels      | List of labels. Each label with a key string (`ks`) and `name` property.  |
| probes      | List of probes. Each probe with a `probe` and `name` property.            |
| environment | Environment where the host is created. With a uuid (`environmentUuid`) and `name` property. |
| lastSeen    | Date/time in ISO 8601 format when Oversight last received data for this host.               |

## Example body (JSON)

```json
{
  "environmentUuids": ["a20224c219ec"],
  "columns": ["hostUuid", "name", "description"]
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/hosts' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuids": [
    "a20224c219ec"
  ],
  "columns": [
    "hostUuid",
    "name",
    "description"
  ]
}'
```
