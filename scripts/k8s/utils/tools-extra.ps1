# nmap + ncat
$nmapUrl = "https://nmap.org/dist/nmap-7.60-win32.zip"
Invoke-WebRequest $nmapUrl -OutFile c:\Windows\Temp\nmap.zip
Expand-Archive C:\Windows\Temp\nmap.zip -Destination "C:\Program Files"
Start-Process -Wait "C:\Program Files\nmap-7.60\vcredist_x86.exe" -ArgumentList "/q"
Start-Process -Wait "C:\Program Files\nmap-7.60\npcap-0.93.exe" -ArgumentList "/npf_startup=yes /loopback_support=yes /dlt_null=yes /admin_only=no /dot11_support=no /vlan_support=no /winpcap_mode=yes /S"

iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install curl –confirm
