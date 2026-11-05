# Secure Azure Cloud Infrastructure

A zero-budget, junior cloud engineer portfolio project that documents a secure Azure web environment. The free version focuses on architecture, Infrastructure as Code (Bicep), local validation, security design, and interview-ready documentation. It does **not** claim that Azure resources have been deployed.

## Project scenario
This project demonstrates the design and implementation planning of a secure Microsoft Azure cloud infrastructure environment.

The objective is to demonstrate practical knowledge of Azure networking, cloud security, identity and access management, storage security, monitoring, and Infrastructure as Code using Bicep.

Project Type: Azure Cloud Engineering Portfolio
Cloud Platform: Microsoft Azure
Infrastructure as Code: Azure Bicep
Operating System: Ubuntu Linux
Web Server: Nginx

## Architecture

![Secure Azure architecture](architecture/architecture.png)

Planned components:
The proposed infrastructure includes:

-Azure Virtual Network (VNet)
-Network Security Group (NSG)
-Ubuntu Linux Virtual Machine
-Nginx web server
-Azure Storage Account
-Microsoft Entra ID and Azure RBAC
-Azure Monitor and alerts
-Bicep infrastructure template

## What each service does

| Service | Purpose |
|---|---|
| Resource group | Logical container for project resources |
| Virtual Network | Private network boundary for Azure resources |
| Subnet | Segments the VNet |
| Network Security Group | Filters network traffic using security rules |
| Virtual Machine | Runs Ubuntu and the Nginx website |
| Storage Account | Stores blob data such as website files and backups |
| Microsoft Entra ID | Identity and authentication service |
| Azure RBAC | Grants permissions at a defined scope |
| Azure Monitor | Collects metrics and supports alerts |
| Bicep | Declarative Infrastructure as Code |

## Network security

See [`security/security-rules.md`](security/security-rules.md).

The intended policy permits web traffic on TCP 80 and 443, and restricts SSH (TCP 22) to a trusted administrator IP range. RDP is not required for this Linux VM. Port 443 requires TLS configuration; an NSG rule alone does not configure HTTPS.

## Identity and access management

Use Microsoft Entra ID for identities and Azure RBAC for authorisation:
- Owner: project administrator only; use sparingly.
- Contributor: approved person who manages resources but does not manage access.
- Reader: person who needs visibility without making changes.

Assign roles at the narrowest appropriate scope (for example, the project resource group). Prefer least privilege, review assignments regularly, and use MFA for interactive accounts. Do not share accounts or store credentials in this repository.

## Monitoring and troubleshooting

Monitoring design:
- Inspect VM metrics such as Percentage CPU.
- Plan an alert for sustained CPU above a chosen threshold (for example, 80%).
- Review VM status and platform health.
- Use boot diagnostics and VM logs when a VM does not start or a service fails.
- For Nginx, check `sudo systemctl status nginx` and relevant logs.
- For network issues, inspect NSG rules, subnet association, NIC configuration, and effective security rules.
- For storage issues, check the identity's data-plane role, container permissions, and storage networking settings.

Azure Monitor, log ingestion, diagnostic settings, and alert notifications can incur costs. Check pricing before enabling paid ingestion or advanced monitoring. These are design and troubleshooting instructions, not evidence of a live test.

## Bicep template

The template is in [`infrastructure/main.bicep`](infrastructure/main.bicep). It defines the NSG, VNet/subnet, public IP, NIC, Linux VM, and Storage Account. It accepts parameters for the storage account name, trusted SSH source prefix, admin username, SSH public key, region, and VM size.

The template is a starting point for learning. Review the selected VM size and Ubuntu image availability in your target region before any deployment. A Standard public IP, VM, disks, and storage can incur charges.

## Local validation

Requirements: Azure CLI with Bicep support.

From the repository root:

```bash
az bicep install
bash scripts/validate.sh
```

This compiles the template locally. Compilation is not the same as a successful Azure deployment. A live deployment also requires an active subscription, permissions, regional capacity, valid parameter values, and budget approval.

## Repository layout

```text
secure-azure-infrastructure/
├── README.md
├── architecture/
│   └── architecture.png
├── infrastructure/
│   └── main.bicep
├── scripts/
│   └── validate.sh
├── security/
│   └── security-rules.md
└── screenshots/
```

