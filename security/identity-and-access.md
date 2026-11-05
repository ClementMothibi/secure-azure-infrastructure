# Identity and permissions plan

Use Microsoft Entra ID for identities and Azure RBAC for permissions.

| Example persona | Suggested built-in role | Scope | Reason |
|---|---|---|---|
| Project administrator | Owner only if necessary | Resource group | Full management including access assignments |
| Infrastructure developer | Contributor | Resource group | Create and manage resources, but cannot grant access |
| Reviewer | Reader | Resource group | View resources without changing them |

Security guidance:
- Prefer the narrowest scope that meets the need.
- Avoid assigning Owner broadly.
- Use MFA and individual accounts.
- Review role assignments periodically.
- Separate management-plane roles from storage data-plane permissions.
- A Reader role on the resource group does not automatically grant permission to read blob contents.
- Never store credentials or private keys in GitHub.
