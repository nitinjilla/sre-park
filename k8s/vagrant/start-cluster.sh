#!/bin/bash

# Author: Nitin Jilla

# Starting the cluster

sudo kubeadm init --apiserver-advertise-address 192.168.10.10 --pod-network-cidr 10.5.0.0/16

# Cluster administration will be done with vagrant user
# Copy the kubernetes-admin config file to its home folder

mkdir -p /home/vagrant/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo chown vagrant:vagrant /home/vagrant/.kube/config

kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml

#kubeadm token create --print-join-command
# Use ^ to generate a token to join the nodes to cluster

