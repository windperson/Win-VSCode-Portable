# Set the user profile to a dummy location for isolation to prevent loading system-level Agent Skills
$env:USERPROFILE = "$PSScriptRoot\hold_user_profile"

$env:CUSTOM_POWERSHELL_PROFILE = "$PSScriptRoot\hold_user_profile\PowerShell_profile.ps1"

 Set-Location -Path $env:USERPROFILE

& "$PSScriptRoot\vscode_zip\Code.exe"