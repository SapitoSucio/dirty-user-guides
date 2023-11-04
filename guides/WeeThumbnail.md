<figure markdown>
  ![WeeThumbnail in action](https://images.weserv.nl/?url=https://i.imgur.com/QMzkGkp.png?v=4&default=https://i.imgur.com/QMzkGkp.png&maxage=7d&l=9)
  <figcaption>WeeThumbnail in action - Win 11</figcaption>
</figure>

# WeeWhat?

“WeeThumbnail” is a DLL that is part of the WeeTools. It allows Windows to preview .spr files directly in Windows Explorer.

It was created by Shinryo

## Installation

There are several way to install WeeThumbnail

### The Fastest

- Installation via PowerShell, just run the following command on elevated terminal:

```PowerShell
Invoke-Expression "& { $(Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/SapitoSucio/dirty-user-guides/master/tools/WeeThumbnail/EzInstall.ps1') }"
```
You can (and should) check the code [here](https://raw.githubusercontent.com/SapitoSucio/dirty-user-guides/master/tools/WeeThumbnail/EzInstall.ps1)

### Fast

- You have to download two files, `StartMe.bat` and `WeeThumbnail.dll`, place them in the same folder and run the `StartMe.bat` with elevated privileges.

#### Download - Right Click and Save link as
 - [StartMe.bat](https://raw.githubusercontent.com/SapitoSucio/dirty-user-guides/master/tools/WeeThumbnail/StartMe.bat)
 - [WeeThumbnail.dll](https://raw.githubusercontent.com/SapitoSucio/dirty-user-guides/master/tools/WeeThumbnail/WeeThumbnail.dll)

!!! info "Your browser may flag both StartMe.bat and WeeThumbnail.dll as dangerous, just as it flags every other .DLL or .BAT file"

### Manual Way

#### Install

- Download [WeeThumbnail.dll](https://raw.githubusercontent.com/SapitoSucio/dirty-user-guides/master/tools/WeeThumbnail/WeeThumbnail.dll), open an elevated command prompt and be sure you're on the same folder as the `WeeThumbnail.dll` and type the following command:

```powershell
regsvr32.exe /i "WeeThumbnail.dll"
```

#### Uninstall

- Download [WeeThumbnail.dll](https://raw.githubusercontent.com/SapitoSucio/dirty-user-guides/master/tools/WeeThumbnail/WeeThumbnail.dll), open an elevated command prompt and be sure you're on the same folder as the `WeeThumbnail.dll` and type the following command:

```powershell
regsvr32.exe /u "WeeThumbnail.dll"
```

!!! info "Your browser may flag WeeThumbnail.dll as dangerous, just as it flags every other .DLL or .BAT file"
