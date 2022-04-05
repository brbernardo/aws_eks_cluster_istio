kubectl apply -f - <<EOF
apiVersion: networking.istio.io/v1alpha3
kind: ServiceEntry
metadata:
  name: localhost
spec:
  hosts:
  - localhost.local
  location: MESH_EXTERNAL
  ports:
  - number: 80
    name: http
    protocol: HTTP
  - number: 443
    name: tls
    protocol: TLS
  resolution: STATIC
  endpoints:
  - address: 127.0.0.1
---
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: localhost
spec:
  host: localhost.local
  trafficPolicy:
    tls:
      mode: DISABLE
      sni: localhost.local
EOF