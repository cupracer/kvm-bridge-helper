#!/bin/bash

# From "man 5 ifcfg":
# The script is executed as "$script $interface $interface -o $action" with the pre-up, post-up, pre-down, post-down actions corresponding with the variable name.
# 
# Example output (ifcfg-br0): br0 br0 -o pre-down

BRIDGE=$1
LOGGER="logger -t KVM-BRIDGE-MONITOR"
STATUS_FILE=/tmp/bridge-info.${BRIDGE}.txt

if ! [ -r $STATUS_FILE ];
then
	$LOGGER "Status file $STATUS_FILE does not exist. Exiting."
	exit 0
else
	$LOGGER "Restoring $BRIDGE links from $STATUS_FILE"
fi

while read i; 
do
	VNET=$(echo $i | grep vnet | awk '{print $2}' | tr -d ':')
	$LOGGER "Attaching $VNET to $BRIDGE"
	ip link set dev $VNET master $BRIDGE
done < $STATUS_FILE

$LOGGER "Removing processed status file for $BRIDGE"
rm $STATUS_FILE

