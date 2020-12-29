_ctid=$1
_type=$2
# Debian
# pct exec $_ctid -- sh -c "wget --no-cache -qO - https://get.docker.com | sh"
# pct exec $_ctid -- echo "Steps for $_type"

# Alpine
# https://wiki.alpinelinux.org/wiki/Docker#Installation
pct exec $_ctid -- apk add docker docker-compose git
pct exec $_ctid -- rc-update add docker boot
pct exec $_ctid -- service docker start
pct exec $_ctid -- git clone https://github.com/floco/mutualis-cloud.git /root/cloud
pct exec $_ctid -- /root/cloud/dc $_type start