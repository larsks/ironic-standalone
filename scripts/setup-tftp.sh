#!/bin/bash

cp /usr/lib/PXELINUX/pxelinux.0 /tftpboot
cp /usr/lib/syslinux/modules/bios/chain.c32 /tftpboot
cp /usr/lib/syslinux/modules/*/ldlinux.* /tftpboot

cat > /tftpboot/map-file <<EOF
re ^(/tftpboot/) /tftpboot/\2
re ^/tftpboot/ /tftpboot/
re ^(^/) /tftpboot/\1
re ^([^/]) /tftpboot/\1
EOF

exec "$@"
