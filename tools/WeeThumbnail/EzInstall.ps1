<#
Script created by: Sapito Sucio
Description: This script allows you to install or uninstall WeeThumbnail.dll.
#>


# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
	Clear-Host
    1..6 | ForEach-Object { Write-Host "This script needs to be run as administrator." }
    Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    Read-Host "Press Enter to exit..."
    exit
}

function Show-Menu {
    Clear-Host
    Write-Host "Menu:" -ForegroundColor Green
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
            Write-Host "Invalid option. Please try again." -ForegroundColor Red
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
	Clear-Host
    $dllPath = Download-WeeThumbnailDll
    $processInfo = Start-Process -FilePath regsvr32.exe -ArgumentList "/i `"$dllPath`"" -Wait -PassThru
    $exitCode = $processInfo.ExitCode
    
    if ($exitCode -eq 0) {
        Write-Host "DLL installed successfully."
    } elseif ($exitCode -eq 3) {
        Write-Host "The DLL is already installed."
    } else {
        Write-Host "Error installing the DLL. Exit code: $exitCode"
    }

    Read-Host "Press Enter to continue..."
    Show-Menu
}

function Uninstall-WeeThumbnail {
	Clear-Host
    $dllUrl = 'https://raw.githubusercontent.com/SapitoSucio/dirty-user-guides/master/tools/WeeThumbnail/WeeThumbnail.dll'
    $dllPath = Join-Path $env:TEMP 'WeeThumbnail.dll'
    $processInfo = Start-Process -FilePath regsvr32.exe -ArgumentList "/u `"$dllPath`"" -Wait -PassThru 
    $exitCode = $processInfo.ExitCode
    
    if ($exitCode -eq 0) {
        Write-Host "DLL uninstalled successfully."
    } elseif ($exitCode -eq 5) {
        Write-Host "The DLL is not registered."
    } else {
        Write-Host "Error uninstalling the DLL. Exit code: $exitCode"
    }

    Read-Host "Press Enter to continue..."
    Show-Menu
}

Show-Menu
