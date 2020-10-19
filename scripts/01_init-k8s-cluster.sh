#!/bin/sh

IPADDR=$(ip address show eth1 | grep inet | grep -v inet6 | awk '{print $2}' | cut -f1 -d/)
HOSTNAME=$(hostname -s)

# Stand Up Kubernetes Cluster
sudo kubeadm init \
  --apiserver-advertise-address=$IPADDR \
  --apiserver-cert-extra-sans=$IPADDR \
  --node-name $HOSTNAME \
  --pod-network-cidr=192.168.0.0/16

# Configure Authentication to k8s master
sudo --user=vagrant mkdir -p /home/vagrant/.kube
cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown $(id -u vagrant):$(id -g vagrant) /home/vagrant/.kube/config
export KUBECONFIG=/etc/kubernetes/admin.conf

kubeadm token create --print-join-command > /etc/kubeadm_join_cmd.sh
  chmod +x /etc/kubeadm_join_cmd.sh
sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo systemctl restart sshd

