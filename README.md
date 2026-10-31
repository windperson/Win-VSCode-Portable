# Portable VS Code

This repository contains a clean [portable mode](https://code.visualstudio.com/docs/setup/portable) Visual Studio Code.

Extract the zip distribution of VSCode and put content in **vscode_zip** folder, run the `Start-VSCode.ps1` to start Visual Studio Code:

```sh
 pwsh -File Start-VSCode.ps1
```

## PowerShell profile isolation

Because by design the PowerShell will always load the default `$PROFILE` , so you need to add few lines in the immmediate front of the `$PROFILE` file:

```pwsh
# To load custom PowerShell profile for different purposes
if (Test-Path Env:CUSTOM_POWERSHELL_PROFILE) {
  . $env:CUSTOM_POWERSHELL_PROFILE
  exit
}
```

Then you can use the profile ps1 file ***hold_user_profile/PowerShell_profile.ps1*** inside the portable Visual Studio code integrated terminal. 