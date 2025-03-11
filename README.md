# eks-helm-argocd

ReplicaSet:
=========
for creating multiple pods , if there is any changes in the configuration replica won't update the change in the pod.
to overcome this problem we have to use "deployment"

Deployment:
==========
replicaset will create multiple pods,if there is any change in the configuration deployment will terminate old pods and created a new pod with configuration updates.


cmds:
=====
* kubectl get pods
* kubectl get replicaset -o wide
* kubectl get pods -o wide yaml
* kubectl get pods "pod-name" | grep image

How to delete default namespace?

kubectl delete -f infra-helm-chart/argo-dev.yaml -n default

how to list all apps in argocd
argocd app list

* bash -x argo.sh ---- to fetch previous execution list

* kubectl delete ingress argocd -n argocd
* kubectl get pods "pod-name" -o yaml, to get pods with podname with yaml file
* argocd app set frontend --parameter appVersion:2.0.2
* argocd app sync frontend
debugging steps
===============
* aws eks update-kubeconfig --name dev-eks (press enter) will get
updated context "" in /home/ec2-user/.kube/config
* cat /home/ec2-user/.kube/config
* aws --region us-east-1 eks get-token --cluster-name dev-eks, will get token
* kubectl get configmap -A
* kubectl get configmap -n kube-system aws-auth -o yaml
* Install aws-auth in workstation where eks cluster installed
aws-auth --version
*  aws-auth upsert --maproles --rolearn arn:aws:iam::00000000000:role/test --username test --groups test --append
* kubectl get configmap -n kube-system aws-auth -o yaml
* kubectl get pods -A(in ci-server)
