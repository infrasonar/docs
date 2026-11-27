# AI Integration (MCP)

InfraSonar provides a hosted **Model Context Protocol (MCP)** server that connects your monitoring environment directly to MCP-compatible AI assistants (such as Claude Desktop, Cursor, Cline, Antigravity, and LibreChat). This allows your AI assistant to query live check data, investigate alerts, inspect condition expressions, and manage operational states using natural language.

---

## Endpoints

The InfraSonar MCP server supports both **Streamable HTTP** (`2025-03-26` spec) and legacy **HTTP + SSE** (`2024-11-05` spec), and separates access into **Read-Only** and **Read-Write** endpoints:

| Access Level | Streamable HTTP *(Recommended)* | HTTP + SSE | Capabilities |
| :--- | :--- | :--- | :--- |
| **Read-Only** *(Recommended)* | `https://mcp.infrasonar.com/ro/mcp` | `https://mcp.infrasonar.com/ro/sse` | Inspect containers, assets, alerts, conditions, collectors, and time-series metrics. No modifications can be made. |
| **Read-Write** | `https://mcp.infrasonar.com/rw/mcp` | `https://mcp.infrasonar.com/rw/sse` | Includes all read-only capabilities plus write actions: closing or assigning alerts, adding alert notes, toggling checks, setting Maintenance/Disabled modes, purging dead time-series, and creating assets. |

> **Tip:** Start with a **Read-Only (`/ro/mcp` or `/ro/sse`)** endpoint for daily triage and root-cause investigation. Only use a **Read-Write (`/rw/mcp` or `/rw/sse`)** endpoint when you explicitly want the assistant to perform changes in your container.

### Which Transport Should I Choose?
* **Streamable HTTP (`/ro/mcp`, `/rw/mcp`):** Recommended for newer MCP clients (such as Antigravity and modern web/IDE clients) that support the `2025-03-26` MCP specification. No local Node.js bridge is required.
* **HTTP + SSE (`/ro/sse`, `/rw/sse`):** Use this if your client specifically expects a Server-Sent Events endpoint (`2024-11-05` MCP specification).

---

## Authentication

All requests to the MCP server require an InfraSonar **API Token** passed via the `Authorization` HTTP header as a Bearer token:

```text
Authorization: Bearer <YOUR_INFRASONAR_API_TOKEN>
```

Make sure the token has the appropriate permissions for the actions you intend to run (for example, at least `API` + `READ` for querying data, or `API` + `READ` + `ASSET_MANAGEMENT` / `CHECK_MANAGEMENT` etc. when using a read-write endpoint). You can authenticate using either a **container token** *(scoped to a single container)* or a **personal API token** *(scoped to all containers you have access to)*.

---

## Client Configuration

Add the InfraSonar MCP server to your AI client configuration file.

### Streamable HTTP Clients (Antigravity / Modern MCP Clients)

```json
{
  "mcpServers": {
    "infrasonar": {
      "serverUrl": "https://mcp.infrasonar.com/ro/mcp",
      "headers": {
        "Authorization": "Bearer YOUR_INFRASONAR_API_TOKEN"
      }
    }
  }
}
```

### SSE Clients (Claude Desktop / Cline / Cursor)

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

> **Note:** To enable write operations, replace `/ro/mcp` with `/rw/mcp` (or `/ro/sse` with `/rw/sse`).

---

## Example Prompts

Once connected, you can ask your AI assistant questions such as:

- _"List the most critical open alerts in container Production and explain how to resolve them."_
- _"Why did the certificate alert trigger on `web-01`? Show me the condition expression and current check data."_
- _"Plot the incoming network traffic for `esx-prod-01` over the last 24 hours."_
- _"Put asset `db-02` into maintenance mode for 60 minutes." (Requires `/rw/mcp` or `/rw/sse`)_