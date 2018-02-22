# Requirements

This assumes you have built compatible Windows server core images via https://github.com/alexandrem/windows-server-core-k8s

Expected vagrant box names:

| Type | Vagrant box               |
| ---- | ------------------------- |
| 1709 | windows-server-core-1709

# Setup

## Requirements

- libvirt
- powershell core v6

## Prep steps

Load the new libvirt network definition in order to not clash with the kubelet 192.168 default range.

```bash
make setup
```

NOTE: change the values if you need something different in your environment.


## About virtualbox

Right now virtualbox is not a good virtual environment or Kubernetes Windows because kubelet cannot read the physical memory correctly (winstats perf counters).


# Usage

```bash
cd 1709
make up
```

## Remote powershell to vagrant windows instances

This requires having the latest powershell core 6.x installed.

Works from linux and MacOS.

Using the `make` shortcut:

```bash
make pwsh-enter
```

# Installing powershell core

TBD
