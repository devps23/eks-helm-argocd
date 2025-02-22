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