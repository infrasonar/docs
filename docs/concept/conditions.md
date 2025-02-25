![Conditions](../images/concept_conditions.png){ width="150" align=right}

# :material-list-status: Conditions

InfraSonar processes check results in real-time, immediately evaluating them against predefined conditions. This ensures rapid detection of anomalies and potential issues.

## Key Features

* **Label-Based Assignment:** [Conditions](../application/conditions.md) are associated with one or more [labels](../application/labels.md), allowing for flexible and targeted application.
* **Asset Association:** By assigning labels to assets, you automatically apply the corresponding conditions. This simplifies configuration and ensures consistent monitoring.
* **Best Practice Library:** InfraSonar includes a comprehensive library of pre-built conditions, developed from years of industry experience and best practices. This provides a solid foundation for your monitoring setup.
* **Simplified Scripting:** Custom conditions can be created or modified using a user-friendly scripting language based on `case` statements. This empowers you to tailor monitoring to your specific needs without requiring extensive programming knowledge.
* **Last know state**, new data can easily be validated against the previous state to detect for example unwanted changes.
* **Forecasting**, forecasting is automatically enabled when used in an condition, ensuring forecasting is enabled when you expect it to be. 