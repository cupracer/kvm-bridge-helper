# kvm-bridge-helper

1. Checkout project to `/opt`.

2. Add scripts to network config file, i.e. `/etc/sysconfig/network/ifcfg-br0`:
```
PRE_DOWN_SCRIPT="compat:suse:/opt/kvm-bridge-helper/save-bridge-links.sh"
POST_UP_SCRIPT="compat:suse:/opt/kvm-bridge-helper/restore-bridge-links.sh"
```

3. Restart network service once to activate options.

