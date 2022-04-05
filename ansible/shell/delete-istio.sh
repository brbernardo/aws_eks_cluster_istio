cd ../istio-1.13.1
istioctl x uninstall -y
kubectl delete namespace istio-system
cd ..
rm -rf istio-1.13.1