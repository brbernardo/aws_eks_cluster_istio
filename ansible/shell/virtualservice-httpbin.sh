kubectl apply -f - <<EOF
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: httpbin
spec:
  hosts:
  - httpbin.org
  gateways:
  - proxy
  - mesh
  http:
  - match:
    - gateways:
      - proxy
      port: 80
      uri:
        prefix: /status
    route:
    - destination:
        host: httpbin.org
        port:
          number: 80
  - match:
    - gateways:
      - mesh
      port: 80
    route:
    - destination:
        host: localhost.local
        port:
          number: 80
---
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: cnn
spec:
  hosts:
  - edition.cnn.com
  gateways:
  - proxy
  - mesh
  tls:
  - match:
    - gateways:
      - proxy
      port: 443
      sni_hosts:
      - edition.cnn.com
    route:
    - destination:
        host: edition.cnn.com
        port:
          number: 443
  - match:
    - gateways:
      - mesh
      port: 443
      sni_hosts:
      - edition.cnn.com
    route:
    - destination:
        host: localhost.local
        port:
          number: 443
EOF