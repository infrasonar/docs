# Automated Script Execution

This guide explains how InfraSonar can automatically trigger script execution when an alert is generated or updated. While this can be achieved via a direct webhook, this guide focuses on the secure solution: executing scripts through a **Remote Appliance (RAPP)**.

## Prerequisites
Before proceeding, you must have an InfraSonar appliance based on Docker Compose with RAPP enabled.

Documentation: [InfraSonar Appliance Setup](https://docs.infrasonar.com/collectors/probes/appliance/)

> **How to verify your appliance:** Open "Agentcores" within your InfraSonar container. Verify that an agentcore is installed and that the "Gear" icon (Manage Remote Appliance) is clickable. If you see an agentcore but no gear icon, your installation is likely outdated or customized and may not support remote execution.

## How it works

When data arrives at InfraSonar, conditions are evaluated. This may result in a new alert or an increase in the severity of an existing one. In both cases, InfraSonar scans the "Rules" to alert users via email, WhatsApp, SMS, VoiceCall, App notifications or webhooks.

For remote execution, a dedicated webhook forwards the request to the relevant appliance. This webhook can include dynamic data from the alert, such as metric values, asset and container properties, or fixed values.

### Security: Passwords and Secrets
To ensure a high level of security, sensitive credentials are not stored within the InfraSonar cloud. Instead:

1. **Local Storage:** Passwords and secrets are configured and stored encrypted on the local appliance within your own network.
2. **Environment Variables:** InfraSonar sends the webhook with dynamic and predefined environment variables (env vars).
3. **Injection:** The local appliance then injects the sensitive `PASSWORD` and `SECRET` variables.
4. **Execution:** Finally, a **Python**, **Bash**, or **PowerShell** script is executed on the appliance using the full set of environment variables.

## Scripting Languages

### Python and Bash
Python and Bash scripts are executed locally on the appliance itself.

### PowerShell
Unlike Python and Bash, PowerShell scripts are designed to be executed on a target machine. Therefore, the script must define its destination in the very first line.

The first line of a PowerShell script must be a comment in the following format:
```ps1
# winrm://{USERNAME}:{PASSWORD}@{HOST}:{PORT}
```

In this example header, `USERNAME`, `PASSWORD`, `HOST`, and `PORT` are dynamically retrieved from environment variables but they may also be hardcoded within the script.

> **Note:** The `:{PORT}` is optional and defaults to **5986** for HTTPS. Use **5985** for HTTP connections.


## Tutorial

In this tutorial, we will create a Python script that sends a **Basic Auth POST** request to a test server when an alert is triggered.

### 1. Create the Script
Create a local file named `rx_tutorial.py` with the following content:

```python
import os
import sys
import asyncio
import aiohttp

async def main():
    # Environment variable from the webhook/appliance
    url = os.getenv('URL', '')
    user = os.getenv('USERNAME', '')
    password = os.getenv('PASSWORD', '')  # Secure from the appliance
    service = os.getenv('SERVICE_NAME', 'unknown')
    action = os.getenv('ACTION', 'restart')

    # Basic Auth setup and payload
    auth = aiohttp.BasicAuth(user, password)
    payload = {"service": service, "command": action}

    try:
        async with aiohttp.ClientSession(auth=auth) as session:
            async with session.post(url, json=payload) as resp:
                print(f"Executing {action} for {service} on {url}")
                print(f"Response status: {resp.status}")

                # Exit 0 on success (2xx), otherwise the HTTP status code
                sys.exit(0 if resp.ok else resp.status)

    except Exception as e:
        print(f"Execution failed: {e}")
        sys.exit(1)

if __name__ == "__main__":
    asyncio.run(main())
```


### 2. Prepare the Appliance
Navigate to **Agentcores** in your InfraSonar container.

- Click the **Gear icon** (Manage remote appliance) and open the **Remote Execution** tab.
- Toggle **Remote execution enabled** to ON.
- *Optional:* Set the log level to **Debug** for detailed troubleshooting during setup.

> **Note:** Missing the tab? Ensure you have the latest RAPP installed by clicking **Pull & Update**.


### 3. Upload and Configure the Script
- Click **Add scripts** --> **Upload script** and select your `rx_tutorial.py` file.
- Click **Upload** and **Confirm**.
- To securely attach the credentials, click the **Edit (pencil) icon** next to the script.
- Set the `PASSWORD` to `password` _(this is the required password for our Postman Echo test)_.
- Apply the changes to the appliance.


### 4. Create the Webhook
We recommend keeping the **Remote Execution tab** open to monitor the logs while configuring the webhook in a new browser tab.

- Go to **Webhooks** and create a new webhook named `RxTutorial`.
- Select the template **"Remote execution alerts"**.
- Select the `rx_tutorial.py` script and choose your appliance's zone _(usually **default**)_.
- In the **Scope** settings, you may want to remove **alert close** if you only want the script to trigger when an alert opens or escalates.

### 5. Configure the Webhook Body
Open the **Body** tab. This is where you define the environment variables for your script.

```json
{
    "script": "rx_tutorial.py",
    "zone": 0,
    "ks": "{{ ks }}",
    "webhook_id": {{ webhook_id }},
    "env": [
        {
            "name": "URL",
            "value": "https://postman-echo.com/basic-auth"
        },
        {
            "name": "USERNAME",
            "value": "postman"
        },
        {
            "name": "SERVICE_NAME",
            "value": "test-service"
        },
        {
            "name": "ACTION",
            "value": "restart"
        }
    ]
}
```

### Understanding the `env` Array
The `env` array defines the environment variables available to your script _(excluding `PASSWORD` and `SECRET`, which are stored securely on the appliance)_.

Each object uses a `from` key to determine the source of the data. If omitted, it defaults to `value`.

### From: `value`
Used for fixed strings or template variables.

```json
{
    "name": "ASSET_NAME",
    "from": "value",
    "value": "{{ asset_name }}"
}
```

### From: `property`
Retrieves properties from the container, asset, or condition that triggered the alert.

> **Note:** Environment variables are always passed as strings. You may need to convert them to integers or floats within your script.

```json
{
    "name": "THRESHOLD",
    "from": "property",
    "property": "memory_limit"
}
```

### From: `metric`
Retrieves a value from a specific metric.

> **Important:** You can only retrieve metrics that belong to the same check and type as the condition that triggered the alert. For example, if a _"Disk Space"_ check triggers the alert, you cannot retrieve a _"CPU Usage"_ metric via this method.

```json
{
    "name": "TEMPERATURE",
    "from": "metric",
    "metric": "chassis_temperature"
}
```

### 6. Save and Test
Save and re-open the webhook to ensure it is stored and assigned an internal ID. Now, navigate to the Test tab. If the configuration is correct, the test should pass.

In your other browser tab _(the **Remote Execution logging**)_, you should see output similar to this:

```plaintext
[I 260402 14:41:47 http:22] execute script `rx_tutorial.py`
[D 260402 14:41:47 protocol:42] Executing restart for test-service on https://postman-echo.com/post
[D 260402 14:41:47 protocol:42] Response status: 200
[I 260402 14:41:47 http:68] script `rx_tutorial.py` success
```

### 7. Audit Logging
You can also verify the execution in the **Log** _(Audit Log)_ of the container. Filter the **Initiator** type to **Rx**. This should display log entries such as:

- `Rx[1] rx_tutorial.py success`
- `Rx[1] rx_tutorial.py started`

### Final Step: Automation
Now that the webhook and script are verified, you can create a **Rule**. Add a condition and an optional asset filter, then bind your new `RxTutorial` webhook to it.

> **Support:** Setting up script execution requires some knowledge of scripting, JSON formatting, and webhooks. We are always here to help! If you run into any issues, please [contact our support team](https://www.infrasonar.com/support).
