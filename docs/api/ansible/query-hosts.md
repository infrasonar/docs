# `POST` /api/ansible/inventory

## Description

Query for hosts.

## Arguments

| key             | value            | description                                                        |
| --------------- | ---------------- | ------------------------------------------------------------------ |
| environmentUuid | str (required)   | An environment uuid.                                               |
| groups          | array (required) | An array with groups. See "Groups" for more information.           |
| columns         | array            | An array with host properties. See "Columns" for more information. |

## Groups

| key    | value           | description                                                                                           |
| ------ | --------------- | ----------------------------------------------------------------------------------------------------- |
| name   | True (required) | Name of the group, only used in generating output. This has no correspondence to any InfraSonar Data. |
| labels | True (required) | Array with label key strings. They are used to find hosts using AND logic.                            |

## Columns

| key         | description                                       |
| ----------- | ------------------------------------------------- |
| hostUuid    | A host uuid.                                      |
| parentUuid  | A parent uuid.                                    |
| address     | The host address.                                 |
| name        | The name of the host which is used in InfraSonar. |
| description | The host description.                             |
| labels      |
| probes      |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "groups": [
    {
      "name": "Windows",
      "labels": ["windows_label_ks"]
    },
    {
      "name": "Linux",
      "labels": ["linux_label_ks"]
    },
    {
      "name": "Web",
      "labels": ["linux_label_ks", "webserver_label_ks"]
    }
  ]
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/ansible/inventory' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec",
  "groups": [
    {
      "name": "Windows",
      "labels": [
        "windows_label_ks"
      ]
    },
    {
      "name": "Linux",
      "labels": [
        "linux_label_ks"
      ]
    },
    {
      "name": "Web",
      "labels": [
        "linux_label_ks",
        "webserver_label_ks"
      ]
    }
  ]
}'
```
