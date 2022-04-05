cd ../istio-1.13.1
kubectl apply -f samples/httpbin/httpbin.yaml
kubectl apply -f <(istioctl kube-inject -f samples/httpbin/httpbin.yaml)
