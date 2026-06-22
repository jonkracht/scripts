#! /usr/bin/env bash

# If not root, re-run this same script with sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "Elevating privileges..."
    exec sudo "$0" "$@"
fi

# Procedure:
# Manually restart driver by unloading/reloading module into kernel with `modprobe`
# i2c_hid_acpi are is a driver for Human Interface Devices connected by $i^{2}c$ bus using ACPI configuration.
# Common applications include laptop touchpads, touchscreens, and specialized keyboards.


#sudo rmmod i2c_hid_acpi && sudo modprobe i2c_hid_acpi

sudo modprobe -r i2c_hid_acpi && sudo modprobe i2c_hid_acpi
