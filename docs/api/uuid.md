# UUID

UUID's are used within InfraSonar to uniquely identify environments and hosts.

## Figuring out UUID's

1. Use your webbrowser to Navigate to the host you to retrieve the UUID's for.
2. Retrieve the `environment UUID` and `host UUID` from the URL.

```
https://app.infrasonar.com/#/c/123/e/xxxxxxxxxxxx/h/xxxxxxxxxxxx-yyyyyyyyyyyy/overview
                                     ============   =========================
                                          ▲                      ▲
Environment UUID ─────────────────────────┘                      │
Host UUID ───────────────────────────────────────────────────────┘
```