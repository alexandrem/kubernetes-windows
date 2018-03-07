$env:KUBE_NETWORK="cbr0"
c:\k\kube-proxy.exe --v=4 --proxy-mode=userspace --hostname-override=$(hostname) --kubeconfig=c:\k\config
