# deploy canary service via argo-rollouts
kubectl apply -f canary-rollout.yaml -f canary-demo-service.yaml -f canary-demo-ingress.yaml

# config /etc/hosts: canary.demo

# modify container image: blue --> green

# verify request header with `X-Canary`
for i in `seq 1 100`; do curl -H "X-Canary: always" http://canary.auto/color; done

# using kubectl-argo-rollouts dashboard manage traffic rate
kubectl argo rollouts dashboard

# promote `canary-demo` to continue running to step3
kubectl argo rollouts promote canary-demo
