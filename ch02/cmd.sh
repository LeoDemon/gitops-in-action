# install kubectl: https://kubernetes.io/docs/tasks/tools/
curl -LO https://dl.k8s.io/release/v1.23.0/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# check kubectl version
kubectl version --client --output=yaml


# install kind: https://kind.sigs.k8s.io/docs/user/quick-start/#installation
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind


# install kubernetes
kind create cluster --config config.yaml

