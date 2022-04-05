cd ../istio-1.13.1
kubectl delete gateway proxy
kubectl delete virtualservice cnn httpbin
kubectl delete serviceentry cnn httpbin-ext localhost
kubectl delete destinationrule localhost