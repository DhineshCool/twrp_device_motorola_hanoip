#!/system/bin/sh

module_path=/sbin/modules
firmware_path=/sbin/firmware
touch_class_path=/sys/class/touchscreen

if [ ! -d "$module_path" ]; then
    if [ -d "/vendor/lib/modules" ]; then
        module_path=/vendor/lib/modules
    fi
fi

if [ ! -d "$firmware_path" ]; then
    if [ -d "/vendor/firmware" ]; then
        firmware_path=/vendor/firmware
    fi
fi

wait_for_poweron()
{
	local wait_nomore=60
	local count=0
	while true; do
		readiness=$(cat $touch_path/poweron 2>/dev/null)
		if [ "$readiness" = "1" ]; then
			break
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

# Load touchscreen and hardware modules
insmod $module_path/exfat.ko 2>/dev/null
insmod $module_path/ilitek_v3_mmi.ko 2>/dev/null
insmod $module_path/mmi_info.ko 2>/dev/null
insmod $module_path/moto_f_usbnet.ko 2>/dev/null
insmod $module_path/qpnp_adaptive_charge.ko 2>/dev/null
insmod $module_path/sx933x_sar.ko 2>/dev/null
insmod $module_path/fpc1020_mmi.ko 2>/dev/null
insmod $module_path/mmi_annotate.ko 2>/dev/null
insmod $module_path/mmi_sys_temp.ko 2>/dev/null
insmod $module_path/mpq-adapter.ko 2>/dev/null
insmod $module_path/sensors_class.ko 2>/dev/null
insmod $module_path/utags.ko 2>/dev/null

if [ -d "$firmware_path" ]; then
    cd $firmware_path
fi

if [ -d "$touch_class_path" ]; then
    touch_product_string=$(ls $touch_class_path 2>/dev/null | head -n 1)
    if [ -n "$touch_product_string" ] && [ -f "$touch_class_path/$touch_product_string/path" ]; then
        firmware_file="FW_ILITEK_TDDI_TM.bin"
        touch_path=/sys$(cat $touch_class_path/$touch_product_string/path | awk '{print $1}')
        if [ -d "$touch_path" ]; then
            wait_for_poweron
            if [ -f "$firmware_path/$firmware_file" ]; then
                echo $firmware_file > $touch_path/doreflash 2>/dev/null
                echo 1 > $touch_path/forcereflash 2>/dev/null
                sleep 5
                echo 1 > $touch_path/reset 2>/dev/null
            fi
        fi
    fi
fi

exit 0
