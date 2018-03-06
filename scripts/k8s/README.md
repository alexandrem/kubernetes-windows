# kubelet

WMI objects are not available in powershell core 6.x, which is required to setup properly the CNI config.

Therefore we have to call with version 5.

```
Install-Module WindowsPSModulePath -Force
Add-WindowsPSModulePath
powershell -File .\start-kubelet.ps1
```

# kube-proxy

```
.\start-kubeproxy.ps1
```
