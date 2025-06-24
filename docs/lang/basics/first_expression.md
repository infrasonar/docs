# Writing you first expression

Let's create an expression to monitor memory usage.

```javascript
// Test if memory usage exceeds 80 percent.
case item.memory_usage_ratio > 0.8:
    return WARNING, "Memory usage of @item.name exceeds 80%"
```

Consider an `item` with the following data:

```json
{
    "name": "MyMachine",
    "os": "Linux",
    "memory_usage_ratio": 0.815
}
```

This expression would trigger an alert with `WARNING` severity:

```
Memory usage of MyMachine exceeds 80%
```


When you're writing expressions in InfraSonar, our editor is designed to make the process smoother and help prevent errors.

As you type, once you enter `item.`, you'll see an autocomplete list of all available metrics on your item. This makes it easy to discover and select the exact metrics you need, without having to remember their names.

The editor also understands data types. This means you can't accidentally compare a numerical metric like `memory_usage_ratio` with a text string, for instance. This built-in validation helps you avoid common mistakes before they even happen.

Similarly, after typing `return` and a _space_, a list of available severities (like `WARNING`, `CRITICAL`, etc.) will pop up, ensuring you select a valid option. Plus, all your expressions are thoroughly validated for syntax and type correctness before you can save them, giving you immediate feedback and preventing invalid configurations from being deployed.



