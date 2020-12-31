_ctid=$1
_type=$2
_gh_token=$3
# Debian
# pct exec $_ctid -- sh -c "wget --no-cache -qO - https://get.docker.com | sh"
# pct exec $_ctid -- echo "Steps for $_type"

# Alpine
# source: https://wiki.alpinelinux.org/wiki/Docker#Installation
# source: https://wildwolf.name/how-to-run-docker-in-alpine-container-in-lxc-lxd/
pct exec $_ctid -- apk add docker docker-compose git

pct exec $_ctid -- git clone https://github.com/floco/mutualis-cloud.git /mutualis-cloud
pct exec $_ctid -- git clone https://${_gh_token}@github.com/floco/mutualis-data.git /mutualis-data

pct exec $_ctid -- cp /mutualis-cloud/patch /etc/init.d/cgroups-patch
pct exec $_ctid -- chmod +x /etc/init.d/cgroups-patch
pct exec $_ctid -- rc-update add cgroups-patch boot 
pct exec $_ctid -- service cgroups-patch start

pct exec $_ctid -- rc-update add docker boot
pct exec $_ctid -- service docker start

pct exec $_ctid -- /mutualis-cloud/dc $_type start