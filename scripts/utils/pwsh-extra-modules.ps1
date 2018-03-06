# Load more modules in powershell core
Install-Module WindowsPSModulePath -Force
Add-WindowsPSModulePath

$env:PsModulePath = "C:\Windows\System32\WindowsPowerShell\v1.0\Modules;C:\Users\vagrant\Documents\PowerShell\Modules;C:\Program Files\PowerShell\Modules;c:\powershell\Modules"
