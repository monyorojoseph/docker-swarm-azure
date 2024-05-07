#!/bin/bash

# action ( start/stop )
read -p "Choose Action ? (start/stop): " action

if [ -n "$action" ]; then

    # Get resource group name
    read -p "Resource Group Name: " RG

    if [ -n "$RG" ]; then
        # Get list of VM names
        read -p "Array of Virtual Machine(s) Name e.g vm-one vm-two: " vms
        
        if [ -n "$vms" ]; then
            # Split the input VM names into an array
            read -ra vm_array <<< "$vms"
            
            # Loop through VM names and start them
            for vm in "${vm_array[@]}"; do
                echo "$action  VM ($vm)"
                az vm $action -g $RG -n $vm --verbose
            done
        else
            echo "No VM names provided."
        fi
    else
        echo "No resource group name provided."
    fi
else
    echo "You didn't select no action."
fi