Param(
    # Todo : Get these values using kubectl
    [string] $clusterCIDR="192.168.0.0/16",
    [string] $KubeDnsServiceIp="11.0.0.10",
    [string] $serviceCIDR="11.0.0.0/8"
)

$pauseImage = "polykube/kubeletwin-pause:1709"

c:\k\kubelet.exe --hostname-override=$(hostname) --v=6 `
    --pod-infra-container-image=$pauseImage --resolv-conf="" `
    --allow-privileged=true --enable-debugging-handlers `
    --cluster-dns=$KubeDnsServiceIp --cluster-domain=cluster.local `
    --kubeconfig=c:\k\config --hairpin-mode=promiscuous-bridge `
    --image-pull-progress-deadline=20m --cgroups-per-qos=false `
    --enforce-node-allocatable="" `
    --network-plugin=cni --cni-bin-dir="c:\k\cni" --cni-conf-dir "c:\k\cni\config"
