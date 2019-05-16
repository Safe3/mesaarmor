{
domain_name init : mlstrustedsubject;
domain_trans kernel /init;
  
  allow / r,w,s,x;
  allow /adb_keys r,w,s,x;
  allow /cache/** r,w,s,x;
  allow /cache/.*\.data r,w,s,x;
  allow /cache/.*\.restore r,w,s,x;
  allow /cache/backup/** r,w,s,x;
  allow /charger r,w,s,x;
  allow /cores/** r,w,s,x;
  allow /data/** r,w,s,x;
  allow /data/.layout_version r,w,s,x;
  allow /data/adb/** r,w,s,x;
  allow /data/anr/** r,w,s,x;
  allow /data/app-asec/** r,w,s,x;
  allow /data/app-private/** r,w,s,x;
  allow /data/app-private/vmdl.*\.tmp/** r,w,s,x;
  allow /data/app/** r,w,s,x;
  allow /data/app/[^/]+/oat/** r,w,s,x;
  allow /data/app/vmdl[^/]+\.tmp/** r,w,s,x;
  allow /data/app/vmdl[^/]+\.tmp/oat/** r,w,s,x;
  allow /data/backup/** r,w,s,x;
  allow /data/bootchart/** r,w,s,x;
  allow /data/cam_socket[0-9] r,w,s,x;
  allow /data/dalvik-cache/** r,w,s,x;
  allow /data/dalvik-cache/profiles/** r,w,s,x;
  allow /data/diag_logs/** r,w,s,x;
  allow /data/drm/** r,w,s,x;
  allow /data/fdAlbum r,w,s,x;
  allow /data/gps/** r,w,s,x;
  allow /data/local/tmp/** r,w,s;
  allow /data/media/** r,w,s,x;
  allow /data/mediadrm/** r,w,s,x;
  allow /data/misc/adb/** r,w,s,x;
  allow /data/misc/audio/** r,w,s,x;
  allow /data/misc/bluedroid/** r,w,s,x;
  allow /data/misc/bluedroid/\.a2dp_ctrl r,w,s,x;
  allow /data/misc/bluedroid/\.a2dp_data r,w,s,x;
  allow /data/misc/bluetooth/** r,w,s,x;
  allow /data/misc/camera/** r,w,s,x;
  allow /data/misc/dhcp/** r,w,s,x;
  allow /data/misc/gatekeeper/** r,w,s,x;
  allow /data/misc/keychain/** r,w,s,x;
  allow /data/misc/keystore/** r,w,s;
  allow /data/misc/logd/** r,w,s,x;
  allow /data/misc/media/** r,w,s,x;
  allow /data/misc/net/** r,w,s,x;
  allow /data/misc/perfprofd/** r,w,s,x;
  allow /data/misc/playready/** r,w,s,x;
  allow /data/misc/sensors/** r,w,s,x;
  allow /data/misc/shared_relro/** r,w,s,x;
  allow /data/misc/sms/** r,w,s,x;
  allow /data/misc/systemkeys/** r,w,s,x;
  allow /data/misc/user/** r,w,s,x;
  allow /data/misc/vold/** r,w,s;
  allow /data/misc/vpn/** r,w,s,x;
  allow /data/misc/wifi/** r,w,s,x;
  allow /data/misc/wifi/hostapd/** r,w,s,x;
  allow /data/misc/wifi/sockets/** r,w,s,x;
  allow /data/misc/wifi/sockets/wpa_ctrl.* r,w,s,x;
  allow /data/misc/zoneinfo/** r,w,s,x;
  allow /data/nfc/** r,w,s,x;
  allow /data/property/** r,w,s,x;
  allow /data/resource-cache/** r,w,s,x;
  allow /data/secure/backup/** r,w,s,x;
  allow /data/security/** r,w,s,x;
  allow /data/system/heapdump/** r,w,s,x;
  allow /data/system/ndebugsocket r,w,s,x;
  allow /data/system/sensors/** r,w,s,x;
  allow /data/system/time/** r,w,s,x;
  allow /data/system/users/[0-9]+/fpdata/** r,w,s,x;
  allow /data/system/users/[0-9]+/wallpaper r,w,s,x;
  allow /data/tombstones/** r,w,s,x;
  allow /data/tombstones/ramdump/** r,w,s,x;
  allow /data/unencrypted/** r,w,s,x;
  allow /default\.prop r,w,s,x;
  allow /dev/** r,w,s,x;
  allow /dev/__kmsg__ r,w,x,s;
  allow /dev/__properties__ r,w,x,s;
  allow /dev/accelerometer r,w,x,s;
  allow /dev/adf-interface[0-9]*\.[0-9]* r,w,x,s;
  allow /dev/adf-overlay-engine[0-9]*\.[0-9]* r,w,x,s;
  allow /dev/adf[0-9]* r,w,x,s;
  allow /dev/akm8973.* r,w,x,s;
  allow /dev/alarm r,w,x,s;
  allow /dev/android_adb.* r,w,x,s;
  allow /dev/ashmem r,w,x,s;
  allow /dev/audio.* r,w,x,s;
  allow /dev/bcm2079x r,w,x,s;
  allow /dev/binder r,w,x,s;
  allow /dev/block/** r,w,x,s;
  allow /dev/block/dm-[0-9]+ r,w,s,x;
  allow /dev/block/loop[0-9]* r,w,x,s;
  allow /dev/block/mmcblk0 r,w,x,s;
  allow /dev/block/mmcblk0rpmb r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/boot r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/cache r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/fsc r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/fsg r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/metadata r,w,s,x;
  allow /dev/block/platform/msm_sdcc\.1/by-name/modemst1 r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/modemst2 r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/recovery r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/ssd r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/system r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/userdata r,w,x,s;
  allow /dev/block/ram[0-9]* r,w,x,s;
  allow /dev/block/vold/.+ r,w,x,s;
  allow /dev/bus/usb(.*)? r,w,x,s;
  allow /dev/cam r,w,x,s;
  allow /dev/console r,w,x,s;
  allow /dev/cpu_dma_latency r,w,x,s;
  allow /dev/cpuctl/** r,w,s,x;
  allow /dev/device-mapper r,w,s,x;
  allow /dev/diag r,w,x,s;
  allow /dev/eac r,w,x,s;
  allow /dev/fscklogs/** r,w,s,x;
  allow /dev/full r,w,x,s;
  allow /dev/fuse r,w,x,s;
  allow /dev/gemini.* r,w,x,s;
  allow /dev/graphics/** r,w,x,s;
  allow /dev/gss r,w,x,s;
  allow /dev/hsicctl[0-3] r,w,x,s;
  allow /dev/hw_random r,w,x,s;
  allow /dev/iio:device[0-9]+ r,w,x,s;
  allow /dev/input(/.*) r,w,x,s;
  allow /dev/ion r,w,x,s;
  allow /dev/jpeg([0-9])+ r,w,x,s;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/kmsg r,w,x,s;
  allow /dev/log/** r,w,x,s;
  allow /dev/mdm r,w,x,s;
  allow /dev/media([0-9])+ r,w,x,s;
  allow /dev/modem.* r,w,x,s;
  allow /dev/mpu r,w,x,s;
  allow /dev/mpuirq r,w,x,s;
  allow /dev/msm_aac.* r,w,x,s;
  allow /dev/msm_acdb r,w,x,s;
  allow /dev/msm_amrnb.* r,w,x,s;
  allow /dev/msm_amrwb.* r,w,x,s;
  allow /dev/msm_camera/** r,w,x,s;
  allow /dev/msm_dsps r,w,x,s;
  allow /dev/msm_mp3 r,w,x,s;
  allow /dev/msm_rotator r,w,x,s;
  allow /dev/msm_rtac r,w,x,s;
  allow /dev/msm_thermal_query r,w,x,s;
  allow /dev/msm_vidc.* r,w,x,s;
  allow /dev/mtd/** r,w,x,s;
  allow /dev/mtp_usb r,w,x,s;
  allow /dev/null r,w,x,s;
  allow /dev/nvhdcp1 r,w,x,s;
  allow /dev/pmsg0 r,w,x,s;
  allow /dev/pn544 r,w,x,s;
  allow /dev/ppp r,w,x,s;
  allow /dev/ptmx r,w,x,s;
  allow /dev/pts r,w,s,x;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /dev/qmi[0-2] r,w,x,s;
  allow /dev/qseecom r,w,x,s;
  allow /dev/ramdump_.* r,w,x,s;
  allow /dev/random r,w,x,s;
  allow /dev/rmnet_mux_ctrl r,w,x,s;
  allow /dev/rpmsg-omx[0-9] r,w,x,s;
  allow /dev/rproc_user r,w,x,s;
  allow /dev/rtc[0-9] r,w,x,s;
  allow /dev/sensors r,w,x,s;
  allow /dev/smd([0-9])+ r,w,x,s;
  allow /dev/smd_sns_dsps r,w,x,s;
  allow /dev/smdcntl[0-7] r,w,x,s;
  allow /dev/smem_log r,w,x,s;
  allow /dev/snd/** r,w,x,s;
  allow /dev/socket/** r,w,x,s;
  allow /dev/socket/adbd r,w,s,x;
  allow /dev/socket/cryptd r,w,s,x;
  allow /dev/socket/dnsproxyd r,w,s,x;
  allow /dev/socket/dumpstate r,w,s,x;
  allow /dev/socket/fwmarkd r,w,s,x;
  allow /dev/socket/gps r,w,s,x;
  allow /dev/socket/installd r,w,s,x;
  allow /dev/socket/lmkd r,w,s,x;
  allow /dev/socket/logd r,w,s,x;
  allow /dev/socket/logdr r,w,s,x;
  allow /dev/socket/logdw r,w,s,x;
  allow /dev/socket/mdns r,w,s,x;
  allow /dev/socket/mdnsd r,w,s,x;
  allow /dev/socket/mpdecision/** r,w,s,x;
  allow /dev/socket/mtpd r,w,s,x;
  allow /dev/socket/netd r,w,s,x;
  allow /dev/socket/property_service r,w,s,x;
  allow /dev/socket/qmux_audio/** r,w,s,x;
  allow /dev/socket/qmux_bluetooth/** r,w,s,x;
  allow /dev/socket/qmux_gps/** r,w,s,x;
  allow /dev/socket/qmux_radio/** r,w,s,x;
  allow /dev/socket/racoon r,w,s,x;
  allow /dev/socket/rild r,w,s,x;
  allow /dev/socket/rild-debug r,w,s,x;
  allow /dev/socket/sap_uim_socket[0-9] r,w,s,x;
  allow /dev/socket/sensor_ctl_socket r,w,s,x;
  allow /dev/socket/vold r,w,s,x;
  allow /dev/socket/wpa_eth[0-9] r,w,s,x;
  allow /dev/socket/wpa_wlan[0-9] r,w,s,x;
  allow /dev/socket/zygote r,w,s,x;
  allow /dev/socket/zygote_secondary r,w,s,x;
  allow /dev/spdif_out.* r,w,x,s;
  allow /dev/tegra.* r,w,x,s;
  allow /dev/tf_driver r,w,x,s;
  allow /dev/tty r,w,x,s;
  allow /dev/ttyHS99 r,w,x,s;
  allow /dev/ttyS[0-9]* r,w,x,s;
  allow /dev/ttyUSB0 r,w,x,s;
  allow /dev/tty[0-9]* r,w,x,s;
  allow /dev/tun r,w,x,s;
  allow /dev/uhid r,w,x,s;
  allow /dev/uinput r,w,x,s;
  allow /dev/uio[0-9]* r,w,x,s;
  allow /dev/urandom r,w,x,s;
  allow /dev/usb-ffs/adb r,w,s,x;
  allow /dev/usb_accessory r,w,x,s;
  allow /dev/v4l-subdev.* r,w,x,s;
  allow /dev/vcs[0-9a-z]* r,w,x,s;
  allow /dev/video([0-9])+ r,w,x,s;
  allow /dev/video[0-9]* r,w,x,s;
  allow /dev/watchdog r,w,x,s;
  allow /dev/wcnss_wlan r,w,x,s;
  allow /dev/xt_qtaguid r,w,x,s;
  allow /dev/zero r,w,x,s;
  allow /efs/** r,w,s,x;
  allow /file_contexts r,w,s,x;
  allow /fstab\..* r,w,s,x;
  allow /init r,w,x,s;
  allow /init\..* r,w,s,x;
  allow /lost\+found r,w,s,x;
  allow /mnt/asec/** r,w,s,x;
  allow /mnt/asec/[^/]+/[^/]+\.zip r,w,s,x;
  allow /mnt/asec/[^/]+/lib/** r,w,s,x;
  allow /mnt/expand/** r,w,s,x;
  allow /mnt/expand/[^/]+/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/[^/]+/oat/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/vmdl[^/]+\.tmp/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/vmdl[^/]+\.tmp/oat/** r,w,s,x;
  allow /mnt/expand/[^/]+/local/tmp/** r,w,s;
  allow /mnt/expand/[^/]+/media/** r,w,s,x;
  allow /mnt/expand/[^/]+/misc/vold/** r,w,s;
  allow /mnt/media_rw/** r,w,s,x;
  allow /mnt/runtime/** r,w,s,x;
  allow /mnt/user/** r,w,s,x;
  allow /persist/** r,w,s,x;
  allow /persist/bluetooth/** r,w,s,x;
  allow /persist/camera_calibration/** r,w,s,x;
  allow /persist/data/** r,w,s,x;
  allow /persist/playready/** r,w,s,x;
  allow /persist/sensors/** r,w,s,x;
  allow /persist/widevine/** r,w,s,x;
  allow /persist/wifi/** r,w,s,x;
  allow /proc r,w,s,x;
  allow /proc/ r,w,s,x;
  allow /proc/cpuinfo r,w,s,x;
  allow /proc/net r,w,s,x;
  allow /proc/net/xt_qtaguid/ctrl r,w,s,x;
  allow /proc/sys/fs/protected_hardlinks r,w,s,x;
  allow /proc/sys/fs/protected_symlinks r,w,s,x;
  allow /proc/sys/fs/suid_dumpable r,w,s,x;
  allow /proc/sys/kernel/core_pattern r,w,s,x;
  allow /proc/sys/kernel/dmesg_restrict r,w,s,x;
  allow /proc/sys/kernel/hotplug r,w,s,x;
  allow /proc/sys/kernel/kptr_restrict r,w,s,x;
  allow /proc/sys/kernel/modprobe r,w,s,x;
  allow /proc/sys/kernel/modules_disabled r,w,s,x;
  allow /proc/sys/kernel/poweroff_cmd r,w,s,x;
  allow /proc/sys/kernel/randomize_va_space r,w,s,x;
  allow /proc/sys/kernel/usermodehelper r,w,s,x;
  allow /proc/sys/net r,w,s,x;
  allow /proc/sys/vm/drop_caches r,w,s,x;
  allow /proc/sys/vm/mmap_min_addr r,w,s,x;
  allow /proc/sysrq-trigger r,w,s,x;
  allow /proc/uid_cputime/remove_uid_range r,w,s,x;
  allow /proc/uid_cputime/show_uid_stat r,w,s,x;
  allow /property_contexts r,w,s,x;
  allow /res/** r,w,s,x;
  allow /sbin/** r,w,s,x;
  allow /seapp_contexts r,w,s,x;
  allow /sepolicy r,w,s,x;
  allow /storage/** r,w,s,x;
  allow /sys/** r,w,s,x;
  allow /sys/class/android_usb/f_rmnet_smd_sdio/transport r,w,s,x;
  allow /sys/devices/platform/bluetooth_rfkill/rfkill/rfkill0/state r,w,s,x;
  allow /sys/devices/platform/nfc-power/nfc_power r,w,s,x;
  allow /sys/devices/system/cpu/** r,w,s,x;
  allow /sys/devices/virtual/android_usb/android0/f_rmnet_smd_sdio/transport r,w,s,x;
  allow /sys/devices/virtual/graphics/fb1/hpd r,w,s,x;
  allow /sys/devices/virtual/graphics/fb1/product_description r,w,s,x;
  allow /sys/devices/virtual/graphics/fb1/vendor_name r,w,s,x;
  allow /sys/devices/virtual/smdpkt/smdcntl([0-9])+/open_timeout r,w,s,x;
  allow /sys/kernel/uevent_helper r,w,s,x;
  allow /sys/module/lowmemorykiller/** r,w,s,x;
  allow /sys/module/pm2/modes/** r,w,s,x;
  allow /sys/module/pm_8x60/modes/** r,w,s,x;
  allow /sys/power/wake_lock r,w,s,x;
  allow /sys/power/wake_unlock r,w,s,x;
  allow /system/bin/app_process32 r,w,x,s;
  allow /system/bin/app_process64 r,w,x,s;
  allow /system/bin/bdAddrLoader r,w,x,s;
  allow /system/bin/bootanimation r,w,x,s;
  allow /system/bin/bridgemgrd r,w,x,s;
  allow /system/bin/debuggerd r,w,x,s;
  allow /system/bin/debuggerd64 r,w,x,s;
  allow /system/bin/dhcpcd r,w,x,s;
  allow /system/bin/drmserver r,w,x,s;
  allow /system/bin/dumpstate r,w,x,s;
  allow /system/bin/e2fsck r,w,x,s;
  allow /system/bin/fingerprintd r,w,x,s;
  allow /system/bin/fsck\.f2fs r,w,x,s;
  allow /system/bin/fsck_msdos r,w,x,s;
  allow /system/bin/gatekeeperd r,w,x,s;
  allow /system/bin/inputflinger r,w,x,s;
  allow /system/bin/install-recovery.sh r,w,x,s;
  allow /system/bin/installd r,w,x,s;
  allow /system/bin/irsc_util r,w,x,s;
  allow /system/bin/keystore r,w,x,s;
  allow /system/bin/lmkd r,w,x,s;
  allow /system/bin/logcat r,w,x,s;
  allow /system/bin/logd r,w,x,s;
  allow /system/bin/mdnsd r,w,x,s;
  allow /system/bin/mediaserver r,w,x,s;
  allow /system/bin/mm-qcamera-daemon r,w,x,s;
  allow /system/bin/mpdecision r,w,x,s;
  allow /system/bin/mtpd r,w,x,s;
  allow /system/bin/netd r,w,x,s;
  allow /system/bin/netmgrd r,w,x,s;
  allow /system/bin/qmuxd r,w,x,s;
  allow /system/bin/qseecomd r,w,x,s;
  allow /system/bin/racoon r,w,x,s;
  allow /system/bin/rild r,w,x,s;
  allow /system/bin/rmt_storage r,w,x,s;
  allow /system/bin/sensors\.qcom r,w,x,s;
  allow /system/bin/servicemanager r,w,x,s;
  allow /system/bin/sh r,w,x,s;
  allow /system/bin/subsystem_ramdump r,w,x,s;
  allow /system/bin/surfaceflinger r,w,x,s;
  allow /system/bin/tf_daemon r,w,x,s;
  allow /system/bin/thermal-engine-hh r,w,x,s;
  allow /system/bin/time_daemon r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/bin/tzdatacheck r,w,x,s;
  allow /system/bin/uncrypt r,w,x,s;
  allow /system/bin/vdc r,w,x,s;
  allow /system/bin/vold r,w,x,s;
  allow /system/bin/wpa_supplicant r,w,x,s;
  allow /system/vendor/bin/gpsd r,w,x,s;
  allow /system/vendor/bin/vss_init r,w,x,s;
  allow /system/xbin/perfprofd r,w,x,s;
  allow /ueventd\..* r,w,s,x;
  allow /vendor/bin/gpsd r,w,x,s;
  allowcom -ipc adb_data_file r; #allow init adb_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc adb_data_file w; #allow init adb_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc adb_keys_file r; #allow init adb_keys_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc adb_keys_file w; #allow init adb_keys_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc adbd_socket r; #allow init adbd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc adbd_socket w; #allow init adbd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc anr_data_file r; #allow init anr_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc anr_data_file w; #allow init anr_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc apk_data_file r; #allow init apk_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc apk_data_file w; #allow init apk_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc apk_private_data_file r; #allow init apk_private_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc apk_private_data_file w; #allow init apk_private_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc apk_private_tmp_file r; #allow init apk_private_tmp_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc apk_private_tmp_file w; #allow init apk_private_tmp_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc apk_tmp_file r; #allow init apk_tmp_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc apk_tmp_file w; #allow init apk_tmp_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc app_data_file w; #allow init app_data_file:fifo_file relabelto;
  allowcom -ipc asec_apk_file r; #allow init asec_apk_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc asec_apk_file w; #allow init asec_apk_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc asec_image_file r; #allow init asec_image_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc asec_image_file w; #allow init asec_image_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc asec_public_file r; #allow init asec_public_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc asec_public_file w; #allow init asec_public_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc audio_data_file r; #allow init audio_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc audio_data_file w; #allow init audio_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc backup_data_file r; #allow init backup_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc backup_data_file w; #allow init backup_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bluetooth_data_file r; #allow init bluetooth_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bluetooth_data_file w; #allow init bluetooth_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bluetooth_efs_file r; #allow init bluetooth_efs_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bluetooth_efs_file w; #allow init bluetooth_efs_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bluetooth_loader_tmpfs r; #allow init bluetooth_loader_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bluetooth_loader_tmpfs w; #allow init bluetooth_loader_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bluetooth_socket r; #allow init bluetooth_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bluetooth_socket w; #allow init bluetooth_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bluetooth_tmpfs r; #allow init bluetooth_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bluetooth_tmpfs w; #allow init bluetooth_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bootanim_tmpfs r; #allow init bootanim_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bootanim_tmpfs w; #allow init bootanim_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bootchart_data_file r; #allow init bootchart_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bootchart_data_file w; #allow init bootchart_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bridge_qmuxd_socket r; #allow init bridge_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bridge_qmuxd_socket w; #allow init bridge_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bridge_tmpfs r; #allow init bridge_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc bridge_tmpfs w; #allow init bridge_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc cache_backup_file r; #allow init cache_backup_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc cache_backup_file w; #allow init cache_backup_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc cache_file r; #allow init cache_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc cache_file w; #allow init cache_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc camera_data_file r; #allow init camera_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc camera_data_file w; #allow init camera_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc camera_socket r; #allow init camera_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc camera_socket w; #allow init camera_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc camera_tmpfs r; #allow init camera_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc camera_tmpfs w; #allow init camera_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc contextmount_type r; #allow init contextmount_type:fifo_file { read lock ioctl open getattr };
  allowcom -ipc contextmount_type w; #allow init contextmount_type:fifo_file { read lock ioctl open getattr };
  allowcom -ipc coredump_file r; #allow init coredump_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc coredump_file w; #allow init coredump_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dalvikcache_data_file r; #allow init dalvikcache_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dalvikcache_data_file w; #allow init dalvikcache_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dalvikcache_profiles_data_file r; #allow init dalvikcache_profiles_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dalvikcache_profiles_data_file w; #allow init dalvikcache_profiles_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc debuggerd_tmpfs r; #allow init debuggerd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc debuggerd_tmpfs w; #allow init debuggerd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dhcp_data_file r; #allow init dhcp_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dhcp_data_file w; #allow init dhcp_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dhcp_tmpfs r; #allow init dhcp_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dhcp_tmpfs w; #allow init dhcp_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc diag_logs r; #allow init diag_logs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc diag_logs w; #allow init diag_logs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dnsproxyd_socket r; #allow init dnsproxyd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dnsproxyd_socket w; #allow init dnsproxyd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc domain r; #allow init domain:unix_dgram_socket { bind create };
  allowcom -ipc domain r; #allow init domain:unix_stream_socket { bind create };
  allowcom -ipc drm_data_file r; #allow init drm_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc drm_data_file w; #allow init drm_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc drmserver_socket r; #allow init drmserver_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc drmserver_socket w; #allow init drmserver_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc drmserver_tmpfs r; #allow init drmserver_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc drmserver_tmpfs w; #allow init drmserver_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dumpstate_socket r; #allow init dumpstate_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dumpstate_socket w; #allow init dumpstate_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dumpstate_tmpfs r; #allow init dumpstate_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc dumpstate_tmpfs w; #allow init dumpstate_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc efs_file r; #allow init efs_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc efs_file w; #allow init efs_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc fingerprintd_data_file r; #allow init fingerprintd_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc fingerprintd_data_file w; #allow init fingerprintd_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc fingerprintd_tmpfs r; #allow init fingerprintd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc fingerprintd_tmpfs w; #allow init fingerprintd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc fsck_tmpfs r; #allow init fsck_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc fsck_tmpfs w; #allow init fsck_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc fwmarkd_socket r; #allow init fwmarkd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc fwmarkd_socket w; #allow init fwmarkd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc gatekeeper_data_file r; #allow init gatekeeper_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc gatekeeper_data_file w; #allow init gatekeeper_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc gatekeeperd_tmpfs r; #allow init gatekeeperd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc gatekeeperd_tmpfs w; #allow init gatekeeperd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc gps_control r; #allow init gps_control:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc gps_control w; #allow init gps_control:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc gps_data_file r; #allow init gps_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc gps_data_file w; #allow init gps_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc gps_socket r; #allow init gps_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc gps_socket w; #allow init gps_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc gpsd_tmpfs r; #allow init gpsd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc gpsd_tmpfs w; #allow init gpsd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc hci_attach_tmpfs r; #allow init hci_attach_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc hci_attach_tmpfs w; #allow init hci_attach_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc heapdump_data_file r; #allow init heapdump_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc heapdump_data_file w; #allow init heapdump_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc init r; #allow init init:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc init r; #allow init init:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc init r; #allow init init:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc init w; #allow init init:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc init w; #allow init init:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc init w; #allow init init:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc init_tmpfs r; #allow init init_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc init_tmpfs w; #allow init init_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc inputflinger_tmpfs r; #allow init inputflinger_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc inputflinger_tmpfs w; #allow init inputflinger_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc install_data_file r; #allow init install_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc install_data_file w; #allow init install_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc install_recovery_tmpfs r; #allow init install_recovery_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc install_recovery_tmpfs w; #allow init install_recovery_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc installd_socket r; #allow init installd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc installd_socket w; #allow init installd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc installd_tmpfs r; #allow init installd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc installd_tmpfs w; #allow init installd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc irsc_util_tmpfs r; #allow init irsc_util_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc irsc_util_tmpfs w; #allow init irsc_util_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc isolated_app_tmpfs r; #allow init isolated_app_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc isolated_app_tmpfs w; #allow init isolated_app_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc keychain_data_file r; #allow init keychain_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc keychain_data_file w; #allow init keychain_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc keystore_data_file w; #allow init keystore_data_file:fifo_file relabelto;
  allowcom -ipc keystore_tmpfs r; #allow init keystore_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc keystore_tmpfs w; #allow init keystore_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc lmkd_socket r; #allow init lmkd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc lmkd_socket w; #allow init lmkd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc lmkd_tmpfs r; #allow init lmkd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc lmkd_tmpfs w; #allow init lmkd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc logd_socket r; #allow init logd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc logd_socket w; #allow init logd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc logd_tmpfs r; #allow init logd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc logd_tmpfs w; #allow init logd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc logdr_socket r; #allow init logdr_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc logdr_socket w; #allow init logdr_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc logdw_socket r; #allow init logdw_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc logdw_socket w; #allow init logdw_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mdns_socket r; #allow init mdns_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mdns_socket w; #allow init mdns_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mdnsd_socket r; #allow init mdnsd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mdnsd_socket w; #allow init mdnsd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mdnsd_tmpfs r; #allow init mdnsd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mdnsd_tmpfs w; #allow init mdnsd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc media_data_file r; #allow init media_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc media_data_file w; #allow init media_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc media_rw_data_file r; #allow init media_rw_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc media_rw_data_file w; #allow init media_rw_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mediaserver_qmuxd_socket r; #allow init mediaserver_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mediaserver_qmuxd_socket w; #allow init mediaserver_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mediaserver_tmpfs r; #allow init mediaserver_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mediaserver_tmpfs w; #allow init mediaserver_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc misc_logd_file r; #allow init misc_logd_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc misc_logd_file w; #allow init misc_logd_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc misc_user_data_file r; #allow init misc_user_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc misc_user_data_file w; #allow init misc_user_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mnt_expand_file r; #allow init mnt_expand_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mnt_expand_file w; #allow init mnt_expand_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mnt_media_rw_file r; #allow init mnt_media_rw_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mnt_media_rw_file w; #allow init mnt_media_rw_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mnt_media_rw_stub_file r; #allow init mnt_media_rw_stub_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mnt_media_rw_stub_file w; #allow init mnt_media_rw_stub_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mnt_user_file r; #allow init mnt_user_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mnt_user_file w; #allow init mnt_user_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mpdecision_socket r; #allow init mpdecision_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mpdecision_socket w; #allow init mpdecision_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mpdecision_tmpfs r; #allow init mpdecision_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mpdecision_tmpfs w; #allow init mpdecision_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mtp_tmpfs r; #allow init mtp_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mtp_tmpfs w; #allow init mtp_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mtpd_socket r; #allow init mtpd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc mtpd_socket w; #allow init mtpd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc net_data_file r; #allow init net_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc net_data_file w; #allow init net_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc netd_socket r; #allow init netd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc netd_socket w; #allow init netd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc netd_tmpfs r; #allow init netd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc netd_tmpfs w; #allow init netd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc netmgrd_qmuxd_socket r; #allow init netmgrd_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc netmgrd_qmuxd_socket w; #allow init netmgrd_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc netmgrd_tmpfs r; #allow init netmgrd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc netmgrd_tmpfs w; #allow init netmgrd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc nfc_data_file r; #allow init nfc_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc nfc_data_file w; #allow init nfc_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc nfc_tmpfs r; #allow init nfc_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc nfc_tmpfs w; #allow init nfc_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc perfprofd_data_file r; #allow init perfprofd_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc perfprofd_data_file w; #allow init perfprofd_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc perfprofd_tmpfs r; #allow init perfprofd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc perfprofd_tmpfs w; #allow init perfprofd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_bluetooth_file r; #allow init persist_bluetooth_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_bluetooth_file w; #allow init persist_bluetooth_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_camera_file r; #allow init persist_camera_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_camera_file w; #allow init persist_camera_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_data_file r; #allow init persist_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_data_file w; #allow init persist_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_drm_file r; #allow init persist_drm_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_drm_file w; #allow init persist_drm_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_file r; #allow init persist_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_file w; #allow init persist_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_sensors_file r; #allow init persist_sensors_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_sensors_file w; #allow init persist_sensors_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_wifi_file r; #allow init persist_wifi_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc persist_wifi_file w; #allow init persist_wifi_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc platform_app_tmpfs r; #allow init platform_app_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc platform_app_tmpfs w; #allow init platform_app_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc property_data_file r; #allow init property_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc property_data_file w; #allow init property_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc property_socket r; #allow init property_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc property_socket w; #allow init property_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc qmux_tmpfs r; #allow init qmux_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc qmux_tmpfs w; #allow init qmux_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc qmuxd_socket r; #allow init qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc qmuxd_socket w; #allow init qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc racoon_socket r; #allow init racoon_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc racoon_socket w; #allow init racoon_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc racoon_tmpfs r; #allow init racoon_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc racoon_tmpfs w; #allow init racoon_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc radio_data_file r; #allow init radio_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc radio_data_file w; #allow init radio_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc radio_qmuxd_socket r; #allow init radio_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc radio_qmuxd_socket w; #allow init radio_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc radio_tmpfs r; #allow init radio_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc radio_tmpfs w; #allow init radio_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc ramdump_data_file r; #allow init ramdump_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc ramdump_data_file w; #allow init ramdump_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc resourcecache_data_file r; #allow init resourcecache_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc resourcecache_data_file w; #allow init resourcecache_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc rild_debug_socket r; #allow init rild_debug_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc rild_debug_socket w; #allow init rild_debug_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc rild_qmuxd_socket r; #allow init rild_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc rild_qmuxd_socket w; #allow init rild_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc rild_socket r; #allow init rild_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc rild_socket w; #allow init rild_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc rild_tmpfs r; #allow init rild_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc rild_tmpfs w; #allow init rild_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc rmt_tmpfs r; #allow init rmt_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc rmt_tmpfs w; #allow init rmt_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc sap_uim_socket r; #allow init sap_uim_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc sap_uim_socket w; #allow init sap_uim_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc security_file w; #allow init security_file:fifo_file relabelto;
  allowcom -ipc sensors_data_file r; #allow init sensors_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc sensors_data_file w; #allow init sensors_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc sensors_qmuxd_socket r; #allow init sensors_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc sensors_qmuxd_socket w; #allow init sensors_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc sensors_socket r; #allow init sensors_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc sensors_socket w; #allow init sensors_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc sensors_tmpfs r; #allow init sensors_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc sensors_tmpfs w; #allow init sensors_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc servicemanager_tmpfs r; #allow init servicemanager_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc servicemanager_tmpfs w; #allow init servicemanager_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc shared_relro_file r; #allow init shared_relro_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc shared_relro_file w; #allow init shared_relro_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc shared_relro_tmpfs r; #allow init shared_relro_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc shared_relro_tmpfs w; #allow init shared_relro_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc shell_data_file w; #allow init shell_data_file:fifo_file relabelto;
  allowcom -ipc shell_tmpfs r; #allow init shell_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc shell_tmpfs w; #allow init shell_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc ssr_tmpfs r; #allow init ssr_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc ssr_tmpfs w; #allow init ssr_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc storage_file r; #allow init storage_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc storage_file w; #allow init storage_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc storage_stub_file r; #allow init storage_stub_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc storage_stub_file w; #allow init storage_stub_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc su_tmpfs r; #allow init su_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc su_tmpfs w; #allow init su_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc surfaceflinger_tmpfs r; #allow init surfaceflinger_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc surfaceflinger_tmpfs w; #allow init surfaceflinger_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_app_data_file r; #allow init system_app_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_app_data_file w; #allow init system_app_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_app_tmpfs r; #allow init system_app_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_app_tmpfs w; #allow init system_app_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_data_file r; #allow init system_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_data_file w; #allow init system_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_ndebug_socket r; #allow init system_ndebug_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_ndebug_socket w; #allow init system_ndebug_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_server_qmuxd_socket r; #allow init system_server_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_server_qmuxd_socket w; #allow init system_server_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_server_tmpfs r; #allow init system_server_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_server_tmpfs w; #allow init system_server_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_wpa_socket r; #allow init system_wpa_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc system_wpa_socket w; #allow init system_wpa_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc systemkeys_data_file r; #allow init systemkeys_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc systemkeys_data_file w; #allow init systemkeys_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc tee_data_file r; #allow init tee_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc tee_data_file w; #allow init tee_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc tee_tmpfs r; #allow init tee_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc tee_tmpfs w; #allow init tee_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc thermald_qmuxd_socket r; #allow init thermald_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc thermald_qmuxd_socket w; #allow init thermald_qmuxd_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc thermald_socket r; #allow init thermald_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc thermald_socket w; #allow init thermald_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc thermald_tmpfs r; #allow init thermald_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc thermald_tmpfs w; #allow init thermald_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc time_data_file r; #allow init time_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc time_data_file w; #allow init time_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc time_tmpfs r; #allow init time_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc time_tmpfs w; #allow init time_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc tombstone_data_file r; #allow init tombstone_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc tombstone_data_file w; #allow init tombstone_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc toolbox_tmpfs r; #allow init toolbox_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc toolbox_tmpfs w; #allow init toolbox_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc tzdatacheck_tmpfs r; #allow init tzdatacheck_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc tzdatacheck_tmpfs w; #allow init tzdatacheck_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc ueventd_tmpfs r; #allow init ueventd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc ueventd_tmpfs w; #allow init ueventd_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc uncrypt_tmpfs r; #allow init uncrypt_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc uncrypt_tmpfs w; #allow init uncrypt_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc unencrypted_data_file r; #allow init unencrypted_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc unencrypted_data_file w; #allow init unencrypted_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc unlabeled r; #allow init unlabeled:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc unlabeled w; #allow init unlabeled:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc untrusted_app_tmpfs r; #allow init untrusted_app_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc untrusted_app_tmpfs w; #allow init untrusted_app_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc vdc_tmpfs r; #allow init vdc_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc vdc_tmpfs w; #allow init vdc_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc vold w; #allow init vold:unix_stream_socket connectto;
  allowcom -ipc vold_data_file w; #allow init vold_data_file:fifo_file relabelto;
  allowcom -ipc vold_socket r; #allow init vold_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc vold_socket w; #allow init vold_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc vold_tmpfs r; #allow init vold_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc vold_tmpfs w; #allow init vold_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc vpn_data_file r; #allow init vpn_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc vpn_data_file w; #allow init vpn_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc vss_tmpfs r; #allow init vss_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc vss_tmpfs w; #allow init vss_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc wallpaper_file r; #allow init wallpaper_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc wallpaper_file w; #allow init wallpaper_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc wifi_data_file r; #allow init wifi_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc wifi_data_file w; #allow init wifi_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc wpa_socket r; #allow init wpa_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc wpa_socket w; #allow init wpa_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc wpa_tmpfs r; #allow init wpa_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc wpa_tmpfs w; #allow init wpa_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc zoneinfo_data_file r; #allow init zoneinfo_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc zoneinfo_data_file w; #allow init zoneinfo_data_file:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc zygote_socket r; #allow init zygote_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc zygote_socket w; #allow init zygote_socket:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc zygote_tmpfs r; #allow init zygote_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -ipc zygote_tmpfs w; #allow init zygote_tmpfs:fifo_file { setattr read create relabelfrom getattr relabelto unlink open };
  allowcom -sig domain k; #allow init domain:process sigkill;
  allowcom -sig init c; #allow init init:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setsockcreate setexec setfscreate signull setrlimit };
  allowcom -sig init k; #allow init init:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setsockcreate setexec setfscreate signull setrlimit };
  allowcom -sig init n; #allow init init:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setsockcreate setexec setfscreate signull setrlimit };
  allowcom -sig init o; #allow init init:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setsockcreate setexec setfscreate signull setrlimit };
  allowcom -sig init s; #allow init init:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setsockcreate setexec setfscreate signull setrlimit };
  allowcom -sig kernel c; #allow init kernel:process { setsched sigchld };
  allowdev -pts devpts r;
allowdev -pts devpts w;

  allowdev -root /dev;
  allowfs cgroup  r,s,x,w;
  allowfs cgroup  w,r,s;
  allowfs proc  r,s,w,x;
  allowfs proc  s,w,r;
  allowfs proc_cpuinfo  r,s,x,w;
  allowfs proc_cpuinfo  s,w,r;
  allowfs proc_drop_caches  r,s,x,w;
  allowfs proc_drop_caches  s,w,r;
  allowfs proc_net  r,s,w,x;
  allowfs proc_net  s,w,r;
  allowfs proc_security  s,w,r;
  allowfs proc_security  w,r,s,x;
  allowfs proc_sysrq  r,s,w,x;
  allowfs proc_sysrq  s,w,r;
  allowfs proc_uid_cputime_removeuid  r,s,x,w;
  allowfs proc_uid_cputime_removeuid  s,w,r;
  allowfs proc_uid_cputime_showstat  r,s,x,w;
  allowfs proc_uid_cputime_showstat  s,w,r;
  allowfs qtaguid_proc  r,s,x,w;
  allowfs qtaguid_proc  s,w,r;
  allowfs selinuxfs  s,w,r;
  allowfs selinuxfs  w,r,s,x;
  allowfs sysfs  r,s,x,w;
  allowfs sysfs  r,s;
  allowfs sysfs  s,w,r;
  allowfs tmpfs  r,s,w,x;
  allowfs tmpfs  w,r,s,x;
  allowfs tmpfs  w,r,s;
  allowfs usbfs  r,s,x,w;
  allowfs usbfs  s,w,r;
  allowfs usermodehelper  s,w,r;
  allowfs usermodehelper  w,r,s,x;
  allowkey init s ;
  allowkey init t ;
  allowkey init w ;
  allownet -protocol raw use;
  allowpriv cap2_syslog;
  allowpriv cap_chown;
  allowpriv cap_dac_override;
  allowpriv cap_fowner;
  allowpriv cap_fsetid;
  allowpriv cap_net_admin;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv cap_sys_admin;
  allowpriv cap_sys_boot;
  allowpriv cap_sys_rawio;
  allowpriv cap_sys_resource;
  allowpriv cap_sys_time;
  allowpriv cap_sys_tty_config;
  allowpriv devcreate;
  allowpriv fs_label;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv klog_adm;
  allowpriv mount;
  allowpriv netlink;
  allowpriv part_relabel;
  allowpriv quotaon;
  allowpriv relabel;
  allowpriv setsecurity;
  allowpriv setsockcreate;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow init adbd:process transition;"
  inline "allow init app_data_file:blk_file relabelto;"
  inline "allow init app_data_file:chr_file relabelto;"
  inline "allow init app_data_file:dir relabelto;"
  inline "allow init app_data_file:file relabelto;"
  inline "allow init app_data_file:lnk_file relabelto;"
  inline "allow init app_data_file:sock_file relabelto;"
  inline "allow init binfmt_miscfs:dir { read search open setattr };" #path_list: 
  inline "allow init binfmt_miscfs:file { read open setattr };" #path_list: 
  inline "allow init bluetooth_efs_file:blk_file relabelto;"
  inline "allow init bluetooth_efs_file:chr_file relabelto;"
  inline "allow init bluetooth_efs_file:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };" #path_list: 
  inline "allow init bluetooth_efs_file:file { setattr read create write relabelfrom getattr relabelto unlink open };" #path_list: 
  inline "allow init bluetooth_efs_file:lnk_file { setattr relabelfrom create getattr relabelto unlink };" #path_list: 
  inline "allow init bluetooth_efs_file:sock_file { setattr read create relabelfrom getattr relabelto unlink open };" #path_list: 
  inline "allow init bluetooth_loader:process transition;"
  inline "allow init bootanim:process transition;"
  inline "allow init bridge:process transition;"
  inline "allow init bridge_qmuxd_socket:blk_file relabelto;"
  inline "allow init bridge_qmuxd_socket:chr_file relabelto;"
  inline "allow init bridge_qmuxd_socket:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init bridge_qmuxd_socket:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init bridge_qmuxd_socket:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init bridge_qmuxd_socket:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "allow init camera:process transition;"
  inline "allow init cgroup:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow init cgroup:file { read open setattr };" #path_list: 
  inline "allow init contextmount_type:dir { read search ioctl open getattr };" #path_list: 
  inline "allow init contextmount_type:file { read lock ioctl open getattr };" #path_list: 
  inline "allow init contextmount_type:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow init contextmount_type:sock_file { read lock ioctl open getattr };" #path_list: 
  inline "allow init debugfs:dir { read search open setattr };" #path_list: 
  inline "allow init debugfs:file { read open setattr };" #path_list: 
  inline "allow init debuggerd:process transition;"
  inline "allow init dev_type:blk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow init dev_type:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow init dev_type:lnk_file create;" #path_list: 
  inline "allow init dhcp:process transition;"
  inline "allow init domain:dir { read search ioctl open getattr };" #path_list: 
  inline "allow init domain:file { read lock ioctl open getattr };" #path_list: 
  inline "allow init domain:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow init drmserver:process transition;"
  inline "allow init drmserver_socket:blk_file relabelto;"
  inline "allow init drmserver_socket:chr_file relabelto;"
  inline "allow init drmserver_socket:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };" #path_list: 
  inline "allow init drmserver_socket:file { setattr read create write relabelfrom getattr relabelto unlink open };" #path_list: 
  inline "allow init drmserver_socket:lnk_file { setattr relabelfrom create getattr relabelto unlink };" #path_list: 
  inline "allow init drmserver_socket:sock_file { setattr read create relabelfrom getattr relabelto unlink open };" #path_list: 
  inline "allow init dumpstate:process transition;"
  inline "allow init fingerprintd:process transition;"
  inline "allow init frp_block_device:chr_file { read open setattr };" #path_list: 
  inline "allow init fsck:process transition;"
  inline "allow init gatekeeperd:process transition;"
  inline "allow init gps_control:blk_file relabelto;"
  inline "allow init gps_control:chr_file relabelto;"
  inline "allow init gps_control:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init gps_control:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init gps_control:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init gps_control:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "allow init gpsd:process transition;"
  inline "allow init hci_attach:process transition;"
  inline "allow init hci_attach_exec:file { read getattr open execute };"
  inline "allow init healthd:process transition;"
  inline "allow init init:dir { read search ioctl open getattr };" #path_list: 
  inline "allow init init:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow init init:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow init inotify:dir { read search open setattr };" #path_list: 
  inline "allow init inotify:file { read open setattr };" #path_list: 
  inline "allow init inputflinger:process transition;"
  inline "allow init install_recovery:process transition;"
  inline "allow init installd:process transition;"
  inline "allow init irsc_util:process transition;"
  inline "allow init keystore:process transition;"
  inline "allow init labeledfs:dir { read search open setattr };" #path_list: 
  inline "allow init labeledfs:file { read open setattr };" #path_list: 
  inline "allow init lmkd:process transition;"
  inline "allow init logd:process transition;"
  inline "allow init mdnsd:process transition;"
  inline "allow init mediaserver:process transition;"
  inline "allow init mediaserver_qmuxd_socket:blk_file relabelto;"
  inline "allow init mediaserver_qmuxd_socket:chr_file relabelto;"
  inline "allow init mediaserver_qmuxd_socket:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init mediaserver_qmuxd_socket:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init mediaserver_qmuxd_socket:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init mediaserver_qmuxd_socket:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "allow init mnt_media_rw_stub_file:blk_file relabelto;"
  inline "allow init mnt_media_rw_stub_file:chr_file relabelto;"
  inline "allow init mnt_media_rw_stub_file:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init mnt_media_rw_stub_file:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init mnt_media_rw_stub_file:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init mnt_media_rw_stub_file:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "allow init mpdecision:process transition;"
  inline "allow init mqueue:dir { read search open setattr };" #path_list: 
  inline "allow init mqueue:file { read open setattr };" #path_list: 
  inline "allow init mtp:process transition;"
  inline "allow init netd:process transition;"
  inline "allow init netmgrd:process transition;"
  inline "allow init netmgrd_qmuxd_socket:blk_file relabelto;"
  inline "allow init netmgrd_qmuxd_socket:chr_file relabelto;"
  inline "allow init netmgrd_qmuxd_socket:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init netmgrd_qmuxd_socket:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init netmgrd_qmuxd_socket:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init netmgrd_qmuxd_socket:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "allow init perfprofd:process transition;"
  inline "allow init pipefs:dir { read search open setattr };" #path_list: 
  inline "allow init pipefs:file { read open setattr };" #path_list: 
  inline "allow init proc_bluetooth_writable:dir { read search open setattr };"
  inline "allow init proc_bluetooth_writable:file { read open setattr };"
  inline "allow init pstorefs:dir { read search open setattr };" #path_list: 
  inline "allow init pstorefs:file { setattr read lock getattr ioctl open };" #path_list: 
  inline "allow init qmux:process transition;"
  inline "allow init racoon:process transition;"
  inline "allow init radio_qmuxd_socket:blk_file relabelto;"
  inline "allow init radio_qmuxd_socket:chr_file relabelto;"
  inline "allow init radio_qmuxd_socket:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init radio_qmuxd_socket:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init radio_qmuxd_socket:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init radio_qmuxd_socket:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "allow init recovery:process transition;"
  inline "allow init rild:process transition;"
  inline "allow init rild_qmuxd_socket:blk_file relabelto;"
  inline "allow init rild_qmuxd_socket:chr_file relabelto;"
  inline "allow init rild_qmuxd_socket:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init rild_qmuxd_socket:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init rild_qmuxd_socket:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init rild_qmuxd_socket:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "allow init rmt:process transition;"
  inline "allow init selinuxfs:dir { read search open setattr };" #path_list: 
  inline "allow init selinuxfs:file { setattr read lock getattr write ioctl open append };" #path_list: 
  inline "allow init sensors:process transition;"
  inline "allow init sensors_qmuxd_socket:blk_file relabelto;"
  inline "allow init sensors_qmuxd_socket:chr_file relabelto;"
  inline "allow init sensors_qmuxd_socket:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init sensors_qmuxd_socket:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init sensors_qmuxd_socket:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init sensors_qmuxd_socket:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "allow init servicemanager:process transition;"
  inline "allow init shell:process transition;"
  inline "allow init shm:dir { read search open setattr };"
  inline "allow init shm:file { read open setattr };"
  inline "allow init slideshow:process transition;"
  inline "allow init sockfs:dir { read search open setattr };" #path_list: 
  inline "allow init sockfs:file { read open setattr };" #path_list: 
  inline "allow init ssr:process transition;"
  inline "allow init storage_stub_file:blk_file relabelto;"
  inline "allow init storage_stub_file:chr_file relabelto;"
  inline "allow init storage_stub_file:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init storage_stub_file:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init storage_stub_file:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init storage_stub_file:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "allow init surfaceflinger:process transition;"
  inline "allow init swap_block_device:blk_file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow init swap_block_device:chr_file { read open setattr };" #path_list: 
  inline "allow init sysfs_writable:dir { read search open setattr };"
  inline "allow init sysfs_writable:file { read open setattr };"
  inline "allow init system_app_data_file:blk_file relabelto;"
  inline "allow init system_app_data_file:chr_file relabelto;"
  inline "allow init system_app_data_file:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };" #path_list: 
  inline "allow init system_app_data_file:file { setattr read create write relabelfrom getattr relabelto unlink open };" #path_list: 
  inline "allow init system_app_data_file:lnk_file { setattr relabelfrom create getattr relabelto unlink };" #path_list: 
  inline "allow init system_app_data_file:sock_file { setattr read create relabelfrom getattr relabelto unlink open };" #path_list: 
  inline "allow init system_server_qmuxd_socket:blk_file relabelto;"
  inline "allow init system_server_qmuxd_socket:chr_file relabelto;"
  inline "allow init system_server_qmuxd_socket:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init system_server_qmuxd_socket:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init system_server_qmuxd_socket:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init system_server_qmuxd_socket:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "allow init tee:process transition;"
  inline "allow init tee_data_file:blk_file relabelto;"
  inline "allow init tee_data_file:chr_file relabelto;"
  inline "allow init tee_data_file:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init tee_data_file:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init tee_data_file:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init tee_data_file:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "allow init thermald:process transition;"
  inline "allow init thermald_qmuxd_socket:blk_file relabelto;"
  inline "allow init thermald_qmuxd_socket:chr_file relabelto;"
  inline "allow init thermald_qmuxd_socket:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init thermald_qmuxd_socket:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init thermald_qmuxd_socket:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init thermald_qmuxd_socket:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "allow init thermald_socket:blk_file relabelto;"
  inline "allow init thermald_socket:chr_file relabelto;"
  inline "allow init thermald_socket:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init thermald_socket:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init thermald_socket:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init thermald_socket:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "allow init time:process transition;"
  inline "allow init tmpfs:chr_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow init tmpfs:dir { rename search setattr read create reparent getattr mounton write relabelfrom ioctl rmdir remove_name open add_name };"
  inline "allow init tmpfs:file { read relabelfrom unlink open setattr };"
  inline "allow init tmpfs:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow init toolbox:process transition;"
  inline "allow init tzdatacheck:process transition;"
  inline "allow init ueventd:process transition;"
  inline "allow init uncrypt:process transition;"
  inline "allow init unlabeled:blk_file relabelto;"
  inline "allow init unlabeled:chr_file relabelto;"
  inline "allow init unlabeled:dir { rename search setattr read create reparent getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };" #path_list: 
  inline "allow init unlabeled:file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };" #path_list: 
  inline "allow init unlabeled:lnk_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };" #path_list: 
  inline "allow init unlabeled:sock_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };" #path_list: 
  inline "allow init untrusted_app_devpts:dir { read search open setattr };"
  inline "allow init untrusted_app_devpts:file { read open setattr };"
  inline "allow init usbfs:dir { read search open setattr };"
  inline "allow init usbfs:file { read open setattr };"
  inline "allow init vdc:process transition;"
  inline "allow init vold:process transition;"
  inline "allow init vss:process transition;"
  inline "allow init watchdogd:process transition;"
  inline "allow init wpa:process transition;"
  inline "allow init zygote:process transition;"
  inline "allow init zygote_tmpfs:blk_file relabelto;"
  inline "allow init zygote_tmpfs:chr_file relabelto;"
  inline "allow init zygote_tmpfs:dir { search setattr read create getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };"
  inline "allow init zygote_tmpfs:file { setattr read create write relabelfrom getattr relabelto unlink open };"
  inline "allow init zygote_tmpfs:lnk_file { setattr relabelfrom create getattr relabelto unlink };"
  inline "allow init zygote_tmpfs:sock_file { setattr read create relabelfrom getattr relabelto unlink open };"
  inline "qmux_socket(init)"
}

