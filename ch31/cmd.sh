# add grafana repo
helm repo add grafana https://grafana.github.io/helm-charts

# install loki
helm upgrade --install loki --namespace=loki-stack grafana/loki-stack --create-namespace --set grafana.enabled=true --set grafana.image.tag="9.3.2"

# check pod for ready
kubectl wait --for=condition=Ready pods --all -n loki-stack --timeout=300s

# get secret for grafana login password
kubectl get secret --namespace loki-stack loki-grafana -o jsonpath="{.data.admin-password}" | base64 --decode; echo

# add svc port-forward for grafana
kubectl port-forward --namespace loki-stack service/loki-grafana 3000:80

# deploy example app
wget -c https://ghproxy.com/https://raw.githubusercontent.com/lyzhang1999/kubernetes-example/main/loki/deployment.yaml
kubectl apply -f deployment.yaml

# LogQL
{app="log-example"} |= `status=` | logfmt | status != `200`

{app="log-example"} |= `status=` | logfmt | status >= `400` | status <= `500`

{app="log-example"} |= `status=` | logfmt | duration > 3us

{app="log-example"} |= `status=` | logfmt | line_format `{{ .duration }} {{ .uri }}`

# count by pod in 10s which duration > 4us
sum by (pod) (count_over_time({app="log-example"} |= `status=` | logfmt | duration > 4us [10s]))

# count by status in 1 minute
sum by (status) (count_over_time({app="log-example"} |= `status=` | logfmt | __error__="" [1m]))

# calculate P99 request duration in 1 minute
quantile_over_time(0.99, {app="log-example"} |= `status=` | logfmt | unwrap duration(duration) | __error__="" [1m]) by (method, status)

