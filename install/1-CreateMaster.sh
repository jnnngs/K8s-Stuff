#Only on the master, download the yaml files for the pod network
wget https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
wget https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

#Look inside calico.yaml and find the network range, adjust if needed.
vi calico.yaml

#Create our kubernetes cluster, specifying a pod network range matching that in calico.yaml!
sudo kubeadm init --pod-network-cidr=192.168.0.0/16

#Configure our account on the master to have admin access to the API server from a non-privileged account.
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#Download yaml files for your pod network
kubectl apply -f rbac-kdd.yaml
kubectl apply -f calico.yaml

#Look for the all the system pods and calico pod to change to Running. 
#The DNS pod won't start until the Pod network is deployed and Running.
kubectl get pods --all-namespaces

#Gives you output over time, rather than repainting the screen on each iteration.
kubectl get pods --all-namespaces --watch

#All system pods should be Running
kubectl get pods --all-namespaces

#Get a list of our current nodes, just the master.
kubectl get nodes 

#Check out the systemd unit, and examine 10-kubeadm.conf
#Remeber the kubelet starts static pod manifests, and thus the core cluster pods
sudo systemctl status kubelet.service 

#check out the directory where the kubeconfig files live
ls /etc/kubernetes

#let's check out the manifests on the master
ls /etc/kubernetes/manifests

#And look more closely at API server and etcd's manifest.
sudo more /etc/kubernetes/manifests/etcd.yaml
sudo more /etc/kubernetes/manifests/kube-apiserver.yaml

kubeadm join 51.38.71.174:6443 --token ul9n74.xfx180we6lzov4bf --discovery-token-ca-cert-hash sha256:971fdd4a19414a8e29982120e3bf2bc6a9627bd8358cb4ddcf5b20f8477db9de

Type:  kubernetes.io/service-account-token

Data
====
ca.crt:     1025 bytes
namespace:  11 bytes
token:      eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJ0dGwtY29udHJvbGxlci10b2tlbi1jazV3bSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJ0dGwtY29udHJvbGxlciIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjgxNjkyMDVjLTRhNWEtMTFlOS05MzhkLWZhMTYzZThmNmIyNSIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTp0dGwtY29udHJvbGxlciJ9.RWOFiOlQkASV1p0-cbMBv8yGbcEwCtAtZodRFfLIM19vgvZ3p1Az3UA_odfhzMcp1N6xVmYEVT9Ok4VfZqPG4IWMytmwv7-2awJQUEouQI8DXtrQ8r3fx2JvmVt085CW4BYvuHBsyNcq8-nCwRBe3XiFmCpZx8Do7tlZbPa8h1Z2BxLBf0OFMrhgbSLLqRJuWMlmXs8GuTAKFLdy3EYonafALgovl49X7KN3rBHyV015jQqX6RyA1PUItvVebjKPmo0Arr-q3i31HgXMWg9eQ4aCPxRu6sIcROUai8QxJftTdcQVpx8-sHPWs0pGPdci29UluVp93qfyaLJ1nPNl0g

Master: 51.38.71.174
Node 1: 51.38.71.191
Node 2: 51.38.80.104

