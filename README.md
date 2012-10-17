hardware_axis_usbnet
====================

ASIX AX88179_178A USB 3.0/2.0 Gigabit Ethernet Network Adapter
Driver Compilation & Configuration on the Linux

==================
Revision History :
==================
Version 1.2.100		Aug. 21, 2012
 * Added read/write EEPROM/eFuse I/O control functions

Version 1.2.0		Jul. 12, 2012
 * Modified the ax88179_link_reset function.
 * Implemented the auto detach function.
 * Supported the AX88178A device.


Version 1.1.0		Jun. 06, 2012
 * Modified the ax88179_led_setting function.
 * Fixups the ethtool_ops struct for compilation issues in newest kernel version 3.3.0. 
 * Fixups the net_device_ops struct for compilation issues in newest kernel version 3.2.0. 
 * Implemented the Rx Bulk In Queue size parameter.

Version	1.0.0 Beta	Jan. 4, 2012
 * Initial release.

================
Prerequisites
================

Prepare to build the driver, you need the Linux kernel sources installed on the
build machine, and make sure that the version of the running kernel must match
the installed kernel sources. If you don't have the kernel sources, you can get
it from www.kernel.org or contact to your Linux distributor. If you don't know
how to do, please refer to KERNEL-HOWTO.

Note: Please make sure the kernel is built with one of the "Support for
       Host-side, EHCI, OHCI, or UHCI" option support.

================
File Description
================
README.md	This file
ax88179_178a.c	AX88179_178A Linux driver main file
axix.h		AX88179_178A Linux driver header file
Makefile	AX88179_178A driver make file
COPYING	GNU GERNERAL LICENSE

===========================
Conditional Compilation Flag
===========================

================
Getting Start
================
Build step.
 
	cd $MYDROID/hardware/axis/usbnet
	export KERNEL_DIR=${DROID_PATH}/kernel/android-3.0
	export KLIB=${KERNEL_DIR}
	export KLIB_BUILD=${KERNEL_DIR}
	make ARCH=arm

===============
DRIVER PARAMETERS
===============
The following parameters can be set when using insmod.

msg_enable=0xNNNNNNN
	specifies the msg_enable of usbnet.

example: insmod ax88179_178a.ko msg_enable=0x00000000


bszie=xx
	specifies the the Rx Bulk In Queue size(KB).
	if bszie value between 1 and 5, the bszie value fixxed at 5KB.
	if bszie value over 24, the bszie value fixxed at 24KB.
	if bszie value equal zero, disabled the bulk in queue function.
	
example: insmod ax88179_178a.ko bszie=12
