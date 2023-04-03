# deploy prod service
kubectl apply -f prod-deployment.yaml

# wait for prod pod to be ready
kubectl wait pods -l app=prod --for condition=Ready --timeout=30s

# deploy prod ingress
kubectl apply -f prod-ingress.yaml

# config /etc/hosts: here author config the 1st line
# 172.18.0.100 canary.demo
# 127.0.0.1 canary.demo

# deploy canary service
kubectl apply -f canary-deployment.yaml

# deploy canary ingress and increase traffic rate
kubectl apply -f canary-ingress.yaml

