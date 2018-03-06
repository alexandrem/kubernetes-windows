$KubeDnsServiceIp="192.168.0.10"
$pauseImage = "polykube/kubeletwin-pause:1709"

c:\k\kubelet.exe --hostname-override=$(hostname) --v=6 `
    --pod-infra-container-image=$pauseImage --resolv-conf="" `
    --allow-privileged=true --enable-debugging-handlers `
    --cluster-dns=$KubeDnsServiceIp --cluster-domain=cluster.local `
    --kubeconfig=c:\k\config --hairpin-mode=promiscuous-bridge `
    --image-pull-progress-deadline=20m --cgroups-per-qos=false `
    --enforce-node-allocatable="" `
    --network-plugin=cni --cni-bin-dir="c:\k\cni" --cni-conf-dir "c:\k\cni\config"
