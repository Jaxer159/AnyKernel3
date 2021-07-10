# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=DragonFire Kernel by Jaxer159
do.devicecheck=1
do.modules=1
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=olive
device.name2=olivelite
device.name3=olivewood
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

set_con() {
  chcon -h u:object_r:"$1":s0 $2
  chcon u:object_r:"$1":s0 $2
}

# AnyKernel install
dump_boot;

ui_print "Adding Dragonfire Boot Script..."
umount /vendor || true
mount -o rw /dev/block/bootdevice/by-name/vendor /vendor
cp -fr /tmp/anykernel/ramdisk/init.qcom.test.rc /vendor/etc/init/hw/init.qcom.test.rc
chmod 644 /vendor/etc/init/hw/init.qcom.test.rc
chown root.root /vendor/etc/init/hw/init.qcom.test.rc
set_con vendor_configs_file /vendor/etc/init/hw/init.qcom.test.rc
ui_print "Dragonfire Boot Script Added!!..."
ui_print "Cleaning /vendor/lib/modules..."
rm -rf /vendor/lib/modules/audio_*
rm -rf /vendor/lib/modules/exfat.ko
ui_print "Cleaned Successfully!"

write_boot;
## end install
