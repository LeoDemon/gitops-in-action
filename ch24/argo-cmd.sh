# deploy Argo Rollout
kubectl create namespace argo-rollouts

wget -c https://ghproxy.com/https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml -O argo-rollout-install.yaml

kubectl apply -n argo-rollouts -f argo-rollout-install.yaml

# deploy blue-green service
kubectl apply -f blue-green-rollout.yaml -f blue-green-service.yaml -f blue-green-ingress.yaml

# install kubectl-argo-rollouts
wget -c https://github.com/argoproj/argo-rollouts/releases/download/v1.4.1/kubectl-argo-rollouts-linux-amd64
sudo mv kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts
sudo chmod 755 /usr/local/bin/kubectl-argo-rollouts

# startup argo rollouts dashboard
kubectl argo rollouts dashboard

