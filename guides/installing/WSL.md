---
comments: true
---

# What's WSL

Windows Subsystem for Linux (WSL) is a compatibility layer for running Linux binary executables natively on Windows. The latest version of WSL is WSL2, which uses a real Linux kernel to provide faster performance and improved compatibility.

In this tutorial, we will guide you through the steps to install and activate WSL2 Debian on Windows.

## Prerequisites

Before we begin, make sure you have the following:

- Windows 10 version 2004 or higher, with Build 19041 or higher.
- Windows 10 Pro, Enterprise, or Education. WSL2 is not supported on Windows 10 Home.
- An internet connection.

## Step 1: Enable WSL and Virtual Machine Platform

Before starting, make sure your PC meets the following requirements:

1. Running Windows 10 Version 1903 (or later) with Build 18362 (or later).
2. Virtualization is enabled in your BIOS settings.

First, we need to enable WSL and the Virtual Machine Platform on your Windows machine. Open PowerShell as an administrator and run the following commands:

```powershell
wsl --install
```

??? warning "You can specity which distribution to use"
    When you use `#!css wsl --install`, for default it will install Ubuntu. You can override
    that specifying which distribution to use.

    ```powershell
    wsl --install -d 
    ```

## Step 2: Install Debian from the Microsoft Store

Now that we have enabled WSL and the Virtual Machine Platform, we can install Debian from the Microsoft Store. Here's how:

1. Open the Microsoft Store app from the Start menu.
2. Search for "Debian" and select it from the search results or [click here](https://www.microsoft.com/store/productId/9MSVKQC78PK6).
3. Click the "Get" button to start the installation process.
4. Wait for the installation to complete.

!!! note "You can choose any other Linux distro"

## Step 3: Set Up Debian

Once Debian is installed, we need to set it up by creating a new user account. Here's how:

1. Open the Start menu and search for "Debian".
2. Launch Debian and wait for it to finish setting up.
3. When prompted, enter a username and password for your new Debian user account.

## Step 4: Activate WSL2

By default, Debian will be running on WSL1. To switch to WSL2, we need to activate it. Here's how:

1. Open a PowerShell window as an administrator.
2. Run the following command to set WSL2 as the default version: `wsl --set-default-version 2`
3. Wait for the command to complete.

## Step 5: Launch Debian in WSL2

Now that WSL2 is activated, we can launch Debian in WSL2 by running the following command in PowerShell:

*[WSL]: Windows Subsystem Linux
