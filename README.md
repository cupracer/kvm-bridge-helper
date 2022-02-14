# kvm-bridge-helper

## Install
1. Checkout project to `/opt`. Effective directory would then be `/opt/kvm-bridge-helper`.
2. Add scripts to network config file, i.e. `/etc/sysconfig/network/ifcfg-br0`:
```
PRE_DOWN_SCRIPT="compat:suse:/opt/kvm-bridge-helper/save-bridge-links.sh"
POST_UP_SCRIPT="compat:suse:/opt/kvm-bridge-helper/restore-bridge-links.sh"
```
3. Restart network service once to activate options.

# Example log:
Service stop:
```
Feb 14 11:24:06 myhost KVM-BRIDGE-MONITOR[17408]: Saving br0 links to /tmp/bridge-info.br0.txt before going down.
```
Service start:
```
Feb 14 11:24:27 myhost KVM-BRIDGE-MONITOR[18210]: Restoring br0 links from /tmp/bridge-info.br0.txt
Feb 14 11:24:27 myhost KVM-BRIDGE-MONITOR[18215]: Attaching vnet0 to br0
Feb 14 11:24:27 myhost KVM-BRIDGE-MONITOR[18217]: Removing processed status file for br0 (/tmp/bridge-info.br0.txt)
```

