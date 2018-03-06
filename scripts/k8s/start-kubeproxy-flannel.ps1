$env:KUBE_NETWORK="vxlan0"
c:\k\kube-proxy.exe --v=4 --proxy-mode=kernelspace --hostname-override=$(hostname) --kubeconfig=c:\k\config
