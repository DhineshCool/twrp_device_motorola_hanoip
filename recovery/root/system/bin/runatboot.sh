#!/system/bin/sh

module_path=/vendor/lib/modules

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware
firmware_file=

# Load TouchScreen Modules
insmod $module_path/exfat.ko
insmod $module_path/ilitek_v3_mmi.ko
insmod $module_path/mmi_info.ko
insmod $module_path/moto_f_usbnet.ko
insmod $module_path/qpnp_adaptive_charge.ko
insmod $module_path/sx933x_sar.ko
insmod $module_path/fpc1020_mmi.ko
insmod $module_path/mmi_annotate.ko
insmod $module_path/mmi_sys_temp.ko
insmod $module_path/mpq-adapter.ko
insmod $module_path/sensors_class.ko
insmod $module_path/utags.ko
insmod $module_path/snd_smartpa_aw882xx.ko
insmod $module_path/fpsensor_spi_tee.ko
insmod $module_path/tzlog_dump.ko
insmod $module_path/mpq-dmx-hw-plugin.ko
insmod $module_path/rdbg.ko
insmod $module_path/watchdog_cpu_ctx.ko
insmod $module_path/watchdogtest.ko
insmod $module_path/qca_cld3_wlan.ko
cd $firmware_path
touch_product_string=$(ls $touch_class_path)
echo "ilitek"
firmware_file="FW_ILITEK_TDDI_TM.bin"
touch_path=/sys$(cat $touch_class_path/$touch_product_string/path | awk '{print $1}')
echo "forcing firmware upgrade"
echo 1 > $touch_path/forcereflash
echo "sending reflash command"
echo $firmware_file > $touch_path/doreflash
sleep 1.5
setprop touch.fw.loaded 1

exit 0
