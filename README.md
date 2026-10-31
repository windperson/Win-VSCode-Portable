# Portable VS Code

This repository contains a clean [portable mode](https://code.visualstudio.com/docs/setup/portable) Visual Studio Code.

## PowerShell profile isolation

Because by design the PowerShell will always load the default `$PROFILE` , so you need to add few lines in the immmediate begin of the `$PROFILE` file:

```pwsh
# To load custom PowerShell profile for different purposes
if (Test-Path Env:CUSTOM_POWERSHELL_PROFILE) {
  . $env:CUSTOM_POWERSHELL_PROFILE
  exit
}
```

Then you can use the profile ps1 file ***hold_user_profile/PowerShell_profile.ps1*** inside the portable Visual Studio code integrated terminal. 
## How to run

1. Extract the [zip distribution of Visual Studio Code (_**x64**_ or _**Arm64**_ according to your machine)](https://code.visualstudio.com/download) and put content in **`vscode_zip`** folder, 
2. In the **`vscode_zip`** folder, Create a symbolic link called **`data`**  point to the uppper **`data`** folder:
   
   ```powershell
   New-Item -ItemType SymbolicLink -Path .\data -Target ..\data
   ```
   
3. Run the `Start-VSCode.ps1` to start Visual Studio Code:
   
    ```sh
    pwsh -NoLogo -NoProfile -ExecutionPolicy Bypass -File Start-VSCode.ps1
    ```

## Create Windows Shourtcut on Desktop

You can run the `Create-Windows-Shourtcut.ps1` PowerShell script to automatically create Windows Desktip shortcut for easier accesss.