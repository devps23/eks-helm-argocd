if [ "$1" == "install" ]; then
#  to create namespace with argocd
 kubectl create namespace argocd
# install argocd
 kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
#  to edit or patch argocd-server instead of ClusterIP add LoadBalancer
 kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
 sleep 10
#echo url argocd-server Loadbalancer
 echo url - https://$(kubectl get svc -n argocd argocd-server | awk '{print $4}' | tail -1)
# username for argocd
 echo username - admin
# password for argocd
 echo password - $(argocd admin initial-password -n argocd | head -1)
fi

if [ "$2" == "jobs" ]; then
# to login argocd
#argocd login loadbalancer type --username admin --password "password"  --insecure --grpc-web
    argocd login $(kubectl get svc -n argocd argocd-server | awk '{print$4}' | tail -1) --username admin --password $(argocd admin initial-password -n argocd | head -1) --insecure --grpc-web
    for app in backend frontend ; do
    argocd app create ${app} --repo https://github.com/devps23/eks-helm-argocd.git --path chart --upsert --dest-server https://kubernetes.default.svc --dest-namespace default.svc --grpc-web --values values/${app}.yaml
    done
fi

 --skip-test-tls

argocd app create backend --repo https://github.com/devps23/eks-helm-argocd.git --path chart --upsert --dest-server https://kubernetes.default.svc --dest-namespace default.svc --grpc-web --values values/${app}.yaml

argocd app create backend --repo https://github.com/devps23/eks-helm-argocd.git --path chart --upsert --dest-server https://kubernetes.default.svc --dest-namespace default.svc --insecure --skip-test-tls --grpc-web --values values/backend.yml