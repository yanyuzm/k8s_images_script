#!/bin/bash
#这是dockerhub上的镜像，v1.12.2版本

images=(kube-apiserver:v1.12.2 kube-controller-manager:v1.12.2 kube-scheduler:v1.12.2 kube-proxy:v1.12.2 pause:3.1 etcd:3.2.24 coredns:1.2.2)
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
