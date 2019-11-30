# K8s-Stuff

https://blog.nobugware.com/post/2019/k3s-on-arm64/

https://github.com/rancher/k3s/issues/233

https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

https://itnext.io/edge-focused-compact-kubernetes-with-micropaas-%CE%BCpaas-k3s-k3os-and-rio-6f7d758e19f1

https://habd.as/post/git-based-continuous-delivery-rio/

https://www.linode.com/docs/kubernetes/deploy-container-image-to-kubernetes/

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

Install K3SUP

curl -sLS https://get.k3sup.dev | sh

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

//Install Desktop
sudo apt-get install raspberrypi-ui-mods

sudo apt-get install xrdp
