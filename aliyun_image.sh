#!/bin/bash
#这是我在阿里云上的镜像，v1.12.0版本
#执行此脚本之后，就可以使用kubeadm初始化集群了

images=(kube-apiserver:v1.12.0 kube-controller-manager:v1.12.0 kube-scheduler:v1.12.0 kube-proxy:v1.12.0 kubernetes-dashboard-amd64:v1.10.0 pause:3.1 etcd:3.2.24 coredns:1.2.2)

for ima in ${images[@]}
do
   docker pull   registry.cn-shenzhen.aliyuncs.com/lurenjia/$ima
   docker tag    registry.cn-shenzhen.aliyuncs.com/lurenjia/$ima   k8s.gcr.io/$ima
   docker rmi  -f $(docker images |grep registry.cn-shenzhen.aliyuncs.com |awk '{print $1":"$2}')

done
docker pull registry.cn-shenzhen.aliyuncs.com/lurenjia/flannel:v0.10.0-amd64
docker  tag  registry.cn-shenzhen.aliyuncs.com/lurenjia/flannel:v0.10.0-amd64    quay.io/coreos/flannel：v0.10.0-amd64
docker rmi -f registry.cn-shenzhen.aliyuncs.com/lurenjia/flannel:v0.10.0-amd64
