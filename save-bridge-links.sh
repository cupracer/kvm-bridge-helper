#!/bin/bash

# From "man 5 ifcfg":
# The script is executed as "$script $interface $interface -o $action" with the pre-up, post-up, pre-down, post-down actions corresponding with the variable name.
# 
# Example output (ifcfg-br0): br0 br0 -o pre-down

BRIDGE=$1
LOGGER="logger -t KVM-BRIDGE-MONITOR"
STATUS_FILE=/tmp/bridge-info.${1}.txt

$LOGGER "Saving $BRIDGE links to $STATUS_FILE before going down."
bridge link show ${BRIDGE} | grep vnet > /tmp/bridge-info.${BRIDGE}.txt

