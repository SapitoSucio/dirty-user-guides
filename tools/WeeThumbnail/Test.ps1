# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {

    1..6 | ForEach-Object { Write-Host "This script needs to be run as administrator." }
    Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    Read-Host "Press Enter to exit..."
    exit
}

function Show-Menu {
    Clear-Host
    Write-Host "Menu:"
    Write-Host "1) Install WeeThumbnail"
    Write-Host "2) Uninstall WeeThumbnail"
    Write-Host "3) Exit"
    $choice = Read-Host "Select an option"

    switch ($choice) {
        "1" {
            Install-WeeThumbnail
        }
        "2" {
            Uninstall-WeeThumbnail
        }
        "3" {
            exit
        }
        default {
            Write-Host "Invalid option. Please try again."
            Start-Sleep -Seconds 2
            Show-Menu
        }
    }
}

# We download WeeThumbnail.dll
function Download-WeeThumbnailDll {
    $dllUrl = 'https://raw.githubusercontent.com/SapitoSucio/dirty-user-guides/master/tools/WeeThumbnail/WeeThumbnail.dll'
    $downloadPath = Join-Path $env:TEMP 'WeeThumbnail.dll'
    Invoke-WebRequest -Uri $dllUrl -OutFile $downloadPath
    return $downloadPath
}

function Install-WeeThumbnail {
    $dllPath = Download-WeeThumbnailDll
    $result = regsvr32.exe /i "$dllPath"
    
    if ($result -eq 0) {
        Write-Host "DLL installed successfully."
    } else {
        Write-Host "Error installing the DLL."
    }

    Read-Host "Press Enter to continue..."
    Show-Menu
}
function Uninstall-WeeThumbnail {
    $dllPath = Join-Path $PSScriptRoot "WeeThumbnail.dll"
    $result = regsvr32.exe /u "$dllPath"
    
    if ($result -eq 0) {
        Write-Host "DLL uninstalled successfully."
    } else {
        Write-Host "Error uninstalling the DLL."
    }

    Read-Host "Press Enter to continue..."
    Show-Menu
}

Show-Menu
