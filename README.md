# K8s-Stuff

pkill -9 k3s

/usr/local/bin/k3s-uninstall.sh

sudo cat /var/lib/rancher/k3s/server/node-token

export K3S_URL="https://192.168.1.XX:6443"

export K3S_TOKEN="XXXXX"

curl -sfL https://get.k3s.io | sh -

sudo k3s agent --server ${K3S_URL} --token ${K3S_TOKEN}
