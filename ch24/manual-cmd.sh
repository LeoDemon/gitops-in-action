# deploy blue service
kubectl apply -f blue_deployment.yaml

# wait for the blue service to be ready
kubectl wait pods -l app=blue --for condition=ready --timeout=90s

# deploy blue service ingress
kubectl apply -f blue_ingress.yaml

# deploy green service
kubectl apply -f green_deployment.yaml

# switch env: blue --> green
kubectl apply -f green_ingress.yaml

