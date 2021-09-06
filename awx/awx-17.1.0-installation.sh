!#/bin/bash

apt update
apt install -y python3-pip ansible docker.io
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
pip3 install cryptography jsonschema docker docker-compose
systemctl enable docker
systemctl start docker
#git clone https://github.com/ansible/awx.git
cd awx
git checkout tags/17.1.0
#git clone https://github.com/ansible/awx-logos.git
cd installer
sed -e 's/# awx_official=false/awx_official=true/; s/# admin_password=password/admin_password=admin/' inventory > tempf
rm -f inventory
mv tempf inventory
read -p "Enter your dockerHUB username: " duser
read -p "Enter your dockerHUB password: " dpass
docker login --username $duser --password $dpass
ansible-playbook -i inventory install.yml -v
