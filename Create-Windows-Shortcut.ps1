param(
    [string]$ShortcutName = "VSCode-Portable",
    [string]$CreateLocation = [Environment]::GetFolderPath('Desktop')
)

$shortcut = Join-Path $CreateLocation "$ShortcutName.lnk"

$targetPath = "powershell.exe"
$pwsh = Get-Command pwsh.exe -CommandType Application -ErrorAction SilentlyContinue
if ($pwsh) {
    $targetPath = "pwsh.exe"
}

$WshShell = New-Object -ComObject WScript.Shell
$shortcutObject = $WshShell.CreateShortcut($shortcut)

$shortcutObject.WorkingDirectory = $PSScriptRoot
$shortcutObject.Arguments = "-NoLogo -NoProfile -ExecutionPolicy Bypass -File $PSScriptRoot\Start-VSCode.ps1"

$shortcutObject.TargetPath = $targetPath
$shortcutObject.IconLocation = "$PSScriptRoot\vscode_zip\Code.exe"
$shortcutObject.Save()

Write-Output "Shortcut created at $shortcut"