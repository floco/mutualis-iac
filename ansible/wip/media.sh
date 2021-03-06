apt-get update
apt-get dist-upgrade
apt-get install git
apt-get install      apt-transport-https      ca-certificates      curl      gnupg2      software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce
apt-get install docker-compose
adduser media
usermod -a -G sudo media
