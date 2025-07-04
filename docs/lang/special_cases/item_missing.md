# Item Missing

While most expressions evaluate live data, InfraSonar also allows you to define conditions specifically for "item missing" alerts. This means an expression can trigger when an item that was previously detected is no longer reporting data or has disappeared.

When defining an "item missing" condition, the expression is evaluated for each item that is currently missing _(i.e., not found in the latest check result, but was present in the previous one)_.

The `item` variable within this context will contain the last known data of the missing item from its previous successful check.

The `prev` variable will always be `null` in an "item missing" expression, as there is no current data point to compare against a previous one. Therefore, `prev` cannot be used in these expressions.

This feature is crucial for detecting outages or accidental deletions of expected items.