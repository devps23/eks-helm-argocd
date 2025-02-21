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