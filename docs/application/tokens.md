![Tokens](../images/application_token.png){ width="150" align=right}

# :material-key-outline: Tokens

Container tokens can be used to authorize external automation to manage InfraSonar data within a container using our [API](../api/overview.md).

!!! warning "Tokens are bound to a container"
    Tokens are used for authentication but also to identify the container.

    As such data sent from an agentcore or agent appears within the container the configured token belongs to.
    
Container tokens are also required for [agentcore](../application/agentcores.md) and [agent](../collectors/agents/index.md) authentication.

!!! tip inline end
    We strongly suggest setting up separate tokens where possible.

## Create container tokens

1. Navigate to the container you want to create a token for.
2. Click the tokens icon :material-key-outline: in the left hand menu.
3. Click the **Add token** button.
4. Give the token a identifiable name and provide just enough access<br>*observe we added some shortcuts to create access tokens for Agentcores and probes*
5. Click **Save**, enter a **reason** and click **confirm**
6. **Reopen** the just created token and copy the ID.

### Pre-defined roles

We predefined three roles to quickly set the correct permissions:

* Agentcore
* Agent
* Agent (no auto asset creation)

### Container token rules

* User who have the de `container Access` flag set can create container tokens.
* A user can not grant more access permissions to a token then he or she already has.