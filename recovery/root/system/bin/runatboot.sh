#!/system/bin/sh

# Run TouchScreen Patch For Stock Users

path=/sbin
mkdir -p $path 2>/dev/null || path=/tmp
if [ -d /vendor/lib/modules ]; then
    cp -r /vendor/lib/modules $path/ 2>/dev/null
fi
if [ -d /vendor/firmware ]; then
    cp -r /vendor/firmware $path/ 2>/dev/null
fi
/system/bin/sh /system/bin/hanoip_touch.sh 2> $path/TouchScreenlog.txt

exit 0
