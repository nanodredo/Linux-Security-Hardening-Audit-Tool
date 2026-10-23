#!/bin/bash

# =======================================================
# Project: Automated Linux Security Audit & Hardening Tool
# Author: Achraf
# Description: Scans Linux OS for security misconfigurations
# =======================================================

REPORT_FILE="security_report_$(date +%Y%m%d_%H%M%S).txt"

echo "=================================================" > "$REPORT_FILE"
echo "        LINUX SECURITY AUDIT REPORT             " >> "$REPORT_FILE"
echo "        Generated on: $(date)                    " >> "$REPORT_FILE"
echo "=================================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# 1. System Information
echo "[+] Collecting System Information..."
echo "--- SYSTEM INFORMATION ---" >> "$REPORT_FILE"
echo "Hostname     : $(hostname)" >> "$REPORT_FILE"
echo "Kernel       : $(uname -r)" >> "$REPORT_FILE"
echo "Uptime       : $(uptime -p)" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# 2. Network Listening Ports
echo "[+] Auditing Network Ports..."
echo "--- OPEN/LISTENING PORTS ---" >> "$REPORT_FILE"
ss -tulpn 2>/dev/null >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# 3. Critical File Permissions & SUID Files Check
echo "[+] Scanning for SUID Binaries (Privilege Escalation Risks)..."
echo "--- SUID BINARIES FOUND ---" >> "$REPORT_FILE"
find / -perm -4000 -type f 2>/dev/null >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# 4. Users with UID 0 (Root Privileges)
echo "[+] Checking for Root Equivalent Accounts..."
echo "--- USERS WITH UID 0 ---" >> "$REPORT_FILE"
grep -E 'v:00:' /etc/passwd >> "$REPORT_FILE" 2>&1 || grep ':0:' /etc/passwd >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# 5. Check /var/backups Directory
echo "[+] Checking Recent Backups..."
echo "--- RECENT BACKUPS IN /var/backups ---" >> "$REPORT_FILE"
ls -la /var/backups 2>/dev/null >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "=================================================" >> "$REPORT_FILE"
echo "[✔] Audit Complete! Report saved to: $REPORT_FILE"
