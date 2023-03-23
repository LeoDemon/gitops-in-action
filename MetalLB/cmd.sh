# install metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.9/config/manifests/metallb-native.yaml

# install config
kubectl apply -f ip-address-pool.yaml -f l2-advertiesement.yaml 

