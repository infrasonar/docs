# Dynamic Thresholds

Setting fixed alert thresholds can be challenging. For instance, is "80% memory usage" truly high? The answer often depends on the specific server or context; 10% might be critical for one system, while 80% is normal for another.

To address this, InfraSonar employs **dynamic thresholds** powered by its forecasting engine, **Enodo**. Based on historical data, Enodo automatically generates an expected upper and lower bound for your metrics. This allows your alerts to adapt to the normal behavior of each individual item.

Consider a traditional fixed threshold:

```javascript
case item.memory_usage_ratio > 0.8:
    return WARNING, "Memory usage too high: @fmt.item.memory_usage_ratio"
```

With dynamic thresholds, you can use the forecasted upper bound instead of a static value:

```javascript
case item.memory_usage_ratio > enodo.memory_usage_ratio?.upper:
    return WARNING, "
Memory usage higher than predicted:
  Actual value: @fmt.item.memory_usage_ratio
  Forecast Upper: @fmt.enodo.memory_usage_ratio.upper
"
```
### Important Considerations
- **Optional Forecasted Values**: Forecasted metrics, such as `enodo.memory_usage_ratio?.upper`, are optional. They will be `null` when a check is first enabled or when there isn't enough historical data for Enodo to generate a reliable forecast.
- **Automatic Forecasting**: You do not need to manually configure or activate forecasting. InfraSonar automatically begins generating forecasts for a metric once an expression referencing `enodo.<metric>` exists.

## Analyzing Differences (Rate of Change)
For metrics that continuously increase, such as counters _(e.g., `error_count`, `byte_sent`)_, comparing the current value directly isn't always meaningful. Instead, it's often more useful to analyze the **difference** or **rate of change** between the current and previous values.

To make this difference independent of your check interval, you can calculate the value per second. This allows for consistent comparisons regardless of how frequently your checks run.

InfraSonar supports this analysis by allowing you to define forecasts based on `diff` (total difference) or `diffps` (difference per second).

Here's how you can alert on an unexpected increase in errors, comparing the current error rate per second (`diffps`) against a forecasted upper bound:

```javascript
case item.error_count.diffps() > enodo.error_count?.diffps.upper:
    return DEBUG, "More errors than expected"
```

This approach helps identify abnormal spikes in activity, even if the total counter value is generally high.
