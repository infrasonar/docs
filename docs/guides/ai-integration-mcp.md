# AI Integration (MCP)

InfraSonar provides a hosted **Model Context Protocol (MCP)** server that connects your monitoring environment directly to MCP-compatible AI assistants (such as Claude Desktop, Cursor, Cline, and LibreChat). This allows your AI assistant to query live check data, investigate alerts, inspect condition expressions, and manage operational states using natural language.

---

## Endpoints

The InfraSonar MCP server uses Server-Sent Events (SSE) and exposes two endpoints depending on the level of access you want to grant your AI assistant:

| Endpoint | URL | Access Level |
| :--- | :--- | :--- |
| **Read-Only** *(Recommended)* | `https://mcp.infrasonar.com/ro/sse` | Inspect containers, assets, alerts, conditions, collectors, and time-series metrics. No modifications can be made. |
| **Read-Write** | `https://mcp.infrasonar.com/rw/sse` | Includes all read-only capabilities plus write actions: closing or assigning alerts, adding alert notes, toggling checks, setting Maintenance/Disabled modes, and creating assets. |

> **Tip:** Start with the **Read-Only (`/ro/sse`)** endpoint for daily triage and root-cause investigation. Only use the **Read-Write (`/rw/sse`)** endpoint when you explicitly want the assistant to perform changes in your container.

---

## Authentication

All requests to the MCP server require an InfraSonar **API Token** passed via the `Authorization` HTTP header as a Bearer token:

```text
Authorization: Bearer <YOUR_INFRASONAR_API_TOKEN>
```

Make sure the token has the appropriate permissions for the actions you intend to run (for example, at least `API` + `READ` for querying data, or `API` + `READ` + `ASSET_MANAGEMENT` / `CHECK_MANAGEMENT` etc. when using the read-write endpoint). You can authenticate using either a container token _(scoped to a single container)_ or a personal API token _(scoped to all containers you have access to)_.

## Client Configuration
Add the InfraSonar MCP server to your AI client configuration file.

Claude Desktop / Cline / Cursor

```json
{
  "mcpServers": {
    "infrasonar": {
      "url": "https://mcp.infrasonar.com/ro/sse",
      "headers": {
        "Authorization": "Bearer YOUR_INFRASONAR_API_TOKEN"
      }
    }
  }
}
```

To enable write operations, replace the URL with `https://mcp.infrasonar.com/rw/sse`.

## Example Prompts
Once connected, you can ask your AI assistant questions such as:

- _"List the most critical open alerts in container Production and explain how to resolve them."_
- _"Why did the certificate alert trigger on `web-01`? Show me the condition expression and current check data."_
- _"Plot the incoming network traffic for `esx-prod-01` over the last 24 hours."_
- _"Put asset `db-02` into maintenance mode for 60 minutes." (Requires `/rw/sse`)_
