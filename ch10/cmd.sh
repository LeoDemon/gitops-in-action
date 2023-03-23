## depends on ch05 scripts

# install ingress-nginx via LoadBalancer type
wget -c https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.1/deploy/static/provider/cloud/deploy.yaml

diff deploy.yaml ../ch05/ingress-nginx.yaml

kubectl delete -f ../ch05/ingress-nginx.yaml

kubectl apply -f deploy.yaml

