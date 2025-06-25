# Case statements

InfraSonar expressions use case statements to define conditional logic.

## Boolean Comparisons
When working with boolean metrics (`true` or `false`), you can test their state directly:

```javascript
case item.is_started:
    return DEBUG, "Service Started: @item.name"
```

To check for a `false` value or perform an explicit comparison:

```javascript
case item.is_started == false:
    return DEBUG, "Service Not Started: @item.name"
```

**Note:** The `==` (equality) and `!=` (inequality) operators can be used to explicitly compare any two values, including `null`, across all data types.

## Numeric Comparisons
Numeric values can be compared using standard relational operators: `==` (equal to), `!=` (not equal to), `>` (greater than), `<` (less than), `>=` (greater than or equal to), and `<=` (less than or equal to).

```javascript
case item.count > 10:
    return DEBUG, "Count too large: @item.count"
```

## String and List Membership
The `in` and `not in` operators are versatile for checking membership.

### Substring Check
To test if a substring exists within a larger string:

```javascript
case 'error' in item.message.lower():
    return ERROR, "Error in message: @item.message"
```

### List Membership
To test if a value is present within a list of values:

```javascript
case weekday in ['Saturday', 'Sunday']:
    return DEBUG, "It is weekend"
```

All elements within a single list must be of the same data type _(e.g., all strings, all integers)_. You cannot mix types within the same list.
