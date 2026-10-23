# 🛡️ Linux Security Audit & Hardening Tool

An automated Bash-based security auditing tool designed to scan Linux systems for potential security misconfigurations, privilege escalation vectors, and unauthorized root access.

## ✨ Features
* System & Kernel Auditing: Gathers essential system details (OS, Kernel, Uptime).
* Network Audit: Detects open/listening network ports using ss.
* Privilege Escalation Risks: Scans for SUID binaries with potential security vulnerabilities.
* Account Security: Identifies accounts with UID 0 (root-equivalent privileges).
* Backup Auditing: Inspects system backup files in /var/backups.
* Automated Reporting: Generates timestamped security audit logs.

## 🚀 Usage
chmod +x security-audit.sh
./security-audit.sh
