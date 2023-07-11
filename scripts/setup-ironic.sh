#!/bin/bash

set -e

cp -a /usr/local/etc/ironic/* /config/

cat > /config/ironic.conf <<EOF
[DEFAULT]
rpc_transport = none
auth_strategy = noauth
enabled_boot_interfaces = pxe
enabled_deploy_interfaces = direct
enabled_hardware_types = redfish
enabled_management_interfaces = redfish
enabled_power_interfaces = redfish

[database]
connection = mysql+pymysql://${MARIADB_USER}:${MARIADB_PASSWORD}@db/${MARIADB_DATABASE}

[ironic]
auth_type = none
endpoint_override = http://localhost:6385

[pxe_filter]
driver = dnsmasq
deny_unknown_macs = true

[iptables]
dnsmasq_interface = eth0

[processing]
store_data = database
EOF

ironic-dbsync --config-file /config/ironic.conf

exec "$@"
