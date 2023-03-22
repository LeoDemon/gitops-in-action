# install ingress-nginx
wget -c https://ghproxy.com/https://raw.githubusercontent.com/lyzhang1999/resource/main/ingress-nginx/ingress-nginx.yaml
kubectl apply -f ingress-nginx.yaml

# install metric-server
wget -c https://ghproxy.com/https://raw.githubusercontent.com/lyzhang1999/resource/main/metrics/metrics.yaml
kubectl apply -f metrics.yaml

# create namespace `example`
kubectl create namespace example

# install postgress db
wget -c https://ghproxy.com/https://raw.githubusercontent.com/lyzhang1999/kubernetes-example/main/deploy/database.yaml
kubectl apply -f database.yaml -n example

# install frontend service
wget -c https://ghproxy.com/https://raw.githubusercontent.com/lyzhang1999/kubernetes-example/main/deploy/frontend.yaml
kubectl apply -f frontend.yaml -n example

# install backend service
wget -c https://ghproxy.com/https://raw.githubusercontent.com/lyzhang1999/kubernetes-example/main/deploy/backend.yaml
kubectl apply -f backend.yaml -n example

# install ingress
wget -c https://ghproxy.com/https://raw.githubusercontent.com/lyzhang1999/kubernetes-example/main/deploy/ingress.yaml
kubectl apply -f ingress.yaml -n example

# install hpa
wget -c https://ghproxy.com/https://raw.githubusercontent.com/lyzhang1999/kubernetes-example/main/deploy/hpa.yaml
kubectl apply -f hpa.yaml -n example

# waiting all pod is ready
kubectl wait --for=condition=Ready pods --all -n example

