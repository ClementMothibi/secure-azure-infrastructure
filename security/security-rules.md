# Network security rules – nsg-web

This file documents the intended inbound network policy for the project.

| Priority | Name | Protocol | Port | Source | Action |
|---:|---|---|---:|---|---|
| 100 | Allow-HTTP | TCP | 80 | Internet | Allow |
| 110 | Allow-HTTPS | TCP | 443 | Internet | Allow |
| 120 | Allow-SSH-From-Admin-IP | TCP | 22 | Your trusted public IP/CIDR | Allow |
| Default | Azure default rules | Any | Any | Any | Deny inbound unless an earlier rule allows it |

## Important notes

- Replace `adminSourcePrefix` with your current trusted public IP in CIDR notation, such as `203.0.113.10/32` (example only).
- Never use `0.0.0.0/0` for SSH.
- Do not create an inbound RDP rule for this Linux VM.
- HTTPS requires an actual TLS certificate and web-server configuration; opening port 443 alone does not enable HTTPS.
- The NSG is associated with the web subnet in the Bicep template.
- Review effective security rules after deployment before claiming a rule is working.
- This is a project design/template. It has not been deployed or tested in a live subscription.

## Suggested validation

1. Confirm the NSG is associated with `snet-web`.
2. Confirm HTTP/HTTPS rules exist only if required by the website.
3. Confirm SSH source is limited to your trusted IP/CIDR.
4. Confirm there is no broad SSH or RDP inbound allow rule.
5. Record test evidence and date when a live test is eventually performed.
