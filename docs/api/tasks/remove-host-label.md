# `POST` /api/task/host-label-remove

## Description

Remove a label from a host at a given timestamp.

## Arguments

| key             | value          | description                                                                                              |
| --------------- | -------------- | -------------------------------------------------------------------------------------------------------- |
| environmentUuid | str (required) | The environment uuid.                                                                                    |
| hostUuid        | str (required) | The host uuid.                                                                                           |
| label           | str (required) | The label key-string.                                                                                    |
| reason          | str            | An audit logging message. Although not required, it is **recommended** to add a reason!!                 |
| schedule        | str            | A crontab line. See [crontab guru](https://crontab.guru/) for more information about the crontab syntax. |
| timestamp       | int            | A unix timestamp.                                                                                        |

## Example body (JSON)

```json
{
  "timestamp": 1573200000,
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "label": "agxzfm92ZXItc2lnaHRyJAsSCEN1c3RvbWVyIghzeXNhZG1pbgwLEgVMYWJlbBixip4BDA",
  "reason": "Remove maintenance label from MYHOST as the planned maintenance window is closed."
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/task/host-label-remove' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
"timestamp": 1573200000,
"environmentUuid": "a20224c219ec",
"hostUuid": "a20224c219ec-0b91ee4ec7bb",
"label": "agxzfm92ZXItc2lnaHRyJAsSCEN1c3RvbWVyIghzeXNhZG1pbgwLEgVMYWJlbBixip4BDA",
"reason": "Remove maintenance label from MYHOST as the planned maintenance window is closed."
}'
```
