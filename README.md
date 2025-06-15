# 🛠️ Network Configuration and Monitoring Toolkit

A simple Bash-based CLI toolkit for sysadmins and network engineers to quickly access vital network configuration and diagnostic tools.

## 🔧 Features

- View network interfaces and IPs
- Show routing table
- List open ports and listening services
- Ping a remote host
- Run traceroute
- Scan local subnet for live hosts
- Monitor bandwidth usage (requires `iftop`)

## 📦 Requirements

- Bash
- `ip`, `ss`, `ping`, `traceroute`, `nmap`, `iftop`
- Some features require `sudo`

Install dependencies:
```bash
sudo apt install traceroute nmap iftop -y
