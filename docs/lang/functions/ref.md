# Function: `ref`

The `ref()` function allows you to access information from a **parent item** when a hierarchical relationship exists between items within the same check result. This is incredibly useful for creating alerts that consider the health or state of a related parent entity.

For example, in a Kubernetes context, a container has a parent (its Pod). If an expression is running for the container, you can use `ref()` to retrieve metrics or properties directly from its associated Pod.

## Syntax
```
<related_item_property>.ref(<parent_metric_name>)
```

## Example
In this Kubernetes scenario, we have an expression evaluating a container. We want to check the status of its parent Pod and trigger an alert if the Pod is not running.

```javascript
// Retrieve the 'status' metric from the container's parent Pod.
// If the Pod or its status isn't found, default to "Unknown".
var.pod_status = item.pod.ref('status') ?? "Unknown"

// If the Pod's status is not "Running", trigger an error alert.
case var.pod_status != "Running":
    return ERROR, "Pod for container @item.name has status: @var.pod_status"
```