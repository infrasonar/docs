# Writing you first expression

Let's create an expression to monitor a simple webpage.

```javascript
// Test if the website has responded with status code 200
case item.statusCode != 200:
    return WARNING, "HTTP Status not OK, actual status: @item.statusCode"
```

Consider an `item` with the following data:

```json
      {
        "name": "https://devapi.infrasonar.com/ready",
        "responseTime": 0.002146540746092796,
        "statusCode": 503
      }
```

This expression would trigger an alert with `WARNING` severity:

```
HTTP Status not OK, actual status: 503
```

When you're writing expressions in InfraSonar, our editor is designed to make the process smoother and help prevent errors.

As you type, once you enter `item.`, you'll see an autocomplete list of all available metrics on your item. This makes it easy to discover and select the exact metrics you need, without having to remember their names.

The editor also understands data types. This means you can't accidentally compare a numerical metric like `statusCode` with a text string, for instance. This built-in validation helps you avoid common mistakes before they even happen.

Similarly, after typing `return` and a _space_, a list of available severities (like `WARNING`, `CRITICAL`, etc.) will pop up, ensuring you select a valid option. Plus, all your expressions are thoroughly validated for syntax and type correctness before you can save them, giving you immediate feedback and preventing invalid configurations from being deployed.

!!! tip "Indentation Matters"
    Indentation is crucial for defining the logic and structure of your expressions. Best practice is to use 4 spaces for indentation. Proper indentation significantly impacts how case statements are interpreted, as demonstrated in the [AND/OR logic documentation](../and_or_logic) where nesting and sequential case statements have distinct meanings.

