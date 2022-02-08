#!/system/bin/sh

module_path=/vendor/lib/modules

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware
firmware_file=

wait_for_poweron()
{
	local wait_nomore
	local readiness
	local count
	wait_nomore=60
	count=0
	while true; do
		readiness=$(cat $touch_path/poweron)
		if [ "$readiness" == "1" ]; then
			break;
		fi
		count=$((count+1))
		[ $count -eq $wait_nomore ] && break
		sleep 1
	done
	if [ $count -eq $wait_nomore ]; then
		return 1
	fi
	return 0
}

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


cd $firmware_path
touch_product_string=$(ls $touch_class_path)
echo "ilitek"
firmware_file="FW_ILITEK_TDDI_TM.bin"
touch_path=/sys$(cat $touch_class_path/$touch_product_string/path | awk '{print $1}')
wait_for_poweron
echo $firmware_file > $touch_path/doreflash
echo 1 > $touch_path/forcereflash
sleep 5
echo 1 > $touch_path/reset

exit 0
