#!/bin/sh

# Wait for tailscale to be fully up
sleep 10

# Get service IDs from serveconfig.json
SERVECONFIG="$(dirname "$0")/serveconfig.json"
svc_ids=$(grep -o '"svc:[^"]*"' "$SERVECONFIG" | sed 's/["\n]//g')

for svc in $svc_ids; do
	echo "Advertising $svc..."
	tailscale serve advertise "$svc"
done
