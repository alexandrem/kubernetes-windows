# Load more modules in powershell core
Install-Module WindowsPSModulePath -Force
Add-WindowsPSModulePath

Enable-WindowsOptionalFeature -Online -FeatureName:Microsoft-Hyper-V -All -NoRestart
