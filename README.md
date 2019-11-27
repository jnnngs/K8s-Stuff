# K8s-Stuff

pkill -9 k3s

/usr/local/bin/k3s-uninstall.sh

sudo cat /var/lib/rancher/k3s/server/node-token

export K3S_URL="https://192.168.1.XX:6443"

export K3S_TOKEN="XXXXX"

curl -sfL https://get.k3s.io | sh -

sudo k3s agent --server ${K3S_URL} --token ${K3S_TOKEN}

ssh-keygen -f "/home/pi/.ssh/known_hosts" -R "192.168.1.XX"

---
KS3UP
/////
Master steps

k3sup install --ip 192.168.1.XX --user pi

sudo kubectl get nodes

/////
Worker node steps...

passwd

sudo raspi-config

-set memory to 16

-change HOSTNAME

sudo vi /boot/cmdline.txt

cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory

sudo reboot

On Master

ssh-copy-id pi@raspberrypiIP

-ssh-keygen, if it needs creating

Install K3SUP

curl -sLS https://get.k3sup.dev | sh

Join worker node

k3sup join --ip WORKER_IP --server-ip MASTER_IP --user pi

Check node added

sudo kubectl get nodes


