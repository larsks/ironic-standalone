#!/bin/bash

set -e

cat > /config/ironic.conf <<EOF
[DEFAULT]
rpc_transport = none
auth_strategy = noauth
enabled_hardware_types = redfish
enabled_boot_interfaces = pxe
enabled_deploy_interfaces = direct

[database]
connection = mysql+pymysql://${MARIADB_USER}:${MARIADB_PASSWORD}@db/${MARIADB_DATABASE}
EOF

ironic-dbsync --config-file /config/ironic.conf

exec "$@"
