# Requirements

This assumes you have built compatible Windows server core images via https://github.com/alexandrem/windows-server-core-k8s

Expected vagrant box names:

| Type | Vagrant box               |
| ---- | ------------------------- |
| 1709 | windows-server-core-1709

# Usage

```bash
vagrant up --provider libvirt
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
