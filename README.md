# Kubernetes on Windows

Purpose of this project is to layout the minimal configuration and system dependencies to get Windows nodes join a Kubernetes cluster successfully in an on-premise deployment.

The setup assumes having the latest bleeding edge dependencies installed (e.g Windows releases, KBs, online features, docker version, etc) to ensure the most compliant and featureful Kubernetes experience.

We deploy all components in virtual environments from prebuilt Windows server core images.


## Setup

### Requirements

- libvirt
- powershell core v6
- windows server core 1709 images

### Images

This assumes you have built compatible Windows server core images via https://github.com/alexandrem/windows-server-core-k8s

Expected vagrant box names:

| Type | Vagrant box               |
| ---- | ------------------------- |
| 1709 | windows-server-core-1709

### Prep steps

Load the new libvirt network definition in order to not clash with the kubelet 192.168 default range.

```bash
make setup
```

NOTE: change the values if you need something different in your environment.


### About virtualbox

Right now virtualbox is not a good virtual environment for Kubernetes Windows because kubelet cannot read the physical memory correctly (winstats perf counters).

TODO: add kubelet error messages and create upstream issue.


## Usage

```bash
cd 1709
make up
```

### Remote powershell to vagrant windows instances

This requires having the latest powershell core 6.x installed.

Works from linux and MacOS.

Using the `make` shortcut:

```bash
make ps-enter
```

## Installing powershell core

To work from a linux or MacOS machine efficiently you need to install powershell core v6.

Windows images should have the proper Win32-OpenSSH setup in place to allow remoting from powershell+ssh.

TBD

# Troubleshoot host environment

Troubleshoot host setup to make kubelet networking functional.

This shouldn't return any errors:

```powershell
powershell.exe -c "iwr https://aka.ms/Debug-ContainerHost.ps1 -useb | iex"

powershell.exe -c "Get-WindowsFeature *hyper-v*"
Get-NetAdapter
Get-VM
Get-VMSwitch
Get-NetCompartment
```