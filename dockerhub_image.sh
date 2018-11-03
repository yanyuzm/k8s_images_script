#!/bin/bash
#这是dockerhub上的镜像，v1.12.2版本

images=(kube-apiserver-amd64:v1.12.2 kube-controller-manager-amd64:v1.12.2 kube-scheduler-amd64:v1.12.2 kube-proxy-amd64:v1.12.2 pause-amd64:3.1 etcd-amd64:3.2.24 coredns-amd64:1.2.2)
images2=flannel:v0.10.0-amd64
for ima in ${images[@]}
do
   docker pull   yanyuzm/$ima
   docker tag    yanyuzm/$ima   k8s.gcr.io/$ima
   docker rmi  -f  yanyuzm/$ima

done
docker pull yanyuzm/$images2
docker tag  yanyuzm/$images2  quay.io/coreos/$images2
docker rmi -f yanyuzm/$images2
