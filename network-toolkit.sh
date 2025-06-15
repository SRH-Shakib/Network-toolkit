#!/bin/bash

# Network Configuration and Monitoring Toolkit
# Author: Your Name
# GitHub: https://github.com/yourusername/network-toolkit

# Check for root privileges where necessary
require_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "This option requires root. Please run with sudo."
        exit 1
    fi
}

show_interfaces() {
    echo "===== Network Interfaces ====="
    ip -brief addr show
}

show_routing_table() {
    echo "===== Routing Table ====="
    ip route show
}

show_open_ports() {
    echo "===== Open Ports ====="
    ss -tuln
}

ping_test() {
    read -rp "Enter hostname or IP to ping: " target
    echo "===== Pinging $target ====="
    ping -c 4 "$target"
}

run_traceroute() {
    read -rp "Enter hostname or IP for traceroute: " target
    echo "===== Traceroute to $target ====="
    traceroute "$target"
}

scan_subnet() {
    read -rp "Enter subnet to scan (e.g., 192.168.1.0/24): " subnet
    echo "===== Scanning subnet $subnet ====="
    if ! command -v nmap &>/dev/null; then
        echo "nmap is not installed. Install it first (sudo apt install nmap)."
        return
    fi
    nmap -sn "$subnet"
}

monitor_bandwidth() {
    echo "===== Bandwidth Monitor ====="
    if ! command -v iftop &>/dev/null; then
        echo "iftop not installed. Install it first (sudo apt install iftop)."
        return
    fi
    require_root
    iftop
}

# Menu
while true; do
    echo ""
    echo "==== Network Toolkit ===="
    echo "1. Show Network Interfaces"
    echo "2. Show Routing Table"
    echo "3. Show Open Ports"
    echo "4. Ping Test"
    echo "5. Traceroute"
    echo "6. Scan Subnet for Live Hosts"
    echo "7. Monitor Bandwidth (iftop)"
    echo "0. Exit"
    read -rp "Choose an option: " choice

    case $choice in
        1) show_interfaces ;;
        2) show_routing_table ;;
        3) show_open_ports ;;
        4) ping_test ;;
        5) run_traceroute ;;
        6) scan_subnet ;;
        7) monitor_bandwidth ;;
        0) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option." ;;
    esac
done
