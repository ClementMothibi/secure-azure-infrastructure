# Monitoring and troubleshooting guide

## Monitoring plan
- Review VM Percentage CPU and availability/health signals.
- Consider an alert when CPU remains above 80% for a sustained period.
- Review platform metrics before enabling paid log ingestion.
- Check Storage Account metrics if storage access or performance is a problem.

## Troubleshooting workflow
1. Identify the affected resource and the time the issue began.
2. Check Azure resource status and recent configuration changes.
3. For website problems, verify the VM is running and Nginx is active:
   `sudo systemctl status nginx`
4. Review Nginx logs:
   `/var/log/nginx/access.log` and `/var/log/nginx/error.log`
5. For connectivity problems, inspect the NSG, subnet association, NIC, IP configuration, and effective security rules.
6. For SSH problems, verify the source IP matches the allowed CIDR and the SSH public key is correct.
7. For storage access problems, check the user's data-plane role and container settings.
8. Record the cause, fix, and evidence.

Cost note: Azure Monitor features, diagnostic settings, Log Analytics ingestion, and alert notifications may incur charges. Check current pricing before enabling them.
