{
domain_name system_server : netdomain,binderservicedomain,mlstrustedsubject,bluetoothdomain;
domain_trans zygote;
  
  allow /adb_keys r,w,s,x;
  allow /cache/** r,w,s,x;
  allow /cache/.*\.data r,w,s,x;
  allow /cache/.*\.restore r,w,s,x;
  allow /cache/backup/** r,w,s,x;
  allow /data/** r,w,s,x;
  allow /data/anr/** r,w,s,x;
  allow /data/app-private/** r,w,s,x;
  allow /data/app-private/vmdl.*\.tmp/** r,w,s,x;
  allow /data/app/** r,w,s,x;
  allow /data/app/[^/]+/oat/** r,w,s,x;
  allow /data/app/vmdl[^/]+\.tmp/** r,w,s,x;
  allow /data/app/vmdl[^/]+\.tmp/oat/** r,w,s,x;
  allow /data/backup/** r,w,s,x;
  allow /data/dalvik-cache/** r,w,s,x;
  allow /data/dalvik-cache/profiles/** r,w,s,x;
  allow /data/local/tmp/** r,w,s;
  allow /data/media/** r,w,s;
  allow /data/misc/adb/** r,w,s,x;
  allow /data/misc/bluedroid/** r,w,s;
  allow /data/misc/bluetooth/** r,w,s;
  allow /data/misc/keychain/** r,w,s,x;
  allow /data/misc/sms/** r,w,s,x;
  allow /data/misc/systemkeys/** r,w,s,x;
  allow /data/misc/vpn/** r,w,s,x;
  allow /data/misc/wifi/** r,w,s,x;
  allow /data/misc/wifi/hostapd/** r,w,s;
  allow /data/misc/wifi/sockets/** r,w,s;
  allow /data/misc/wifi/sockets/wpa_ctrl.* r,w,s;
  allow /data/misc/zoneinfo/** r,w,s,x;
  allow /data/nfc/** r,w,s;
  allow /data/resource-cache/** r,w,s,x;
  allow /data/secure/backup/** r,w,s,x;
  allow /data/security/** r,w,s,x;
  allow /data/system/heapdump/** r,w,s,x;
  allow /data/system/ndebugsocket r,w,s;
  allow /data/system/users/[0-9]+/fpdata/** r,w,s;
  allow /data/system/users/[0-9]+/wallpaper r,w,x,s;
  allow /data/tombstones/** r,w,s,x;
  allow /data/tombstones/ramdump/** r,w,s,x;
  allow /dev/** r,w,s;
  allow /dev/accelerometer r,w,x,s;
  allow /dev/akm8973.* r,w,x,s;
  allow /dev/alarm r,w,x,s;
  allow /dev/ashmem r,x,s;
  allow /dev/audio.* r,w,s,x;
  allow /dev/block/** s;
  allow /dev/bus/usb(.*)? r,w,s,x;
  allow /dev/eac r,w,s,x;
  allow /dev/fscklogs/** r,w,s,x;
  allow /dev/gss r,w,x,s;
  allow /dev/hsicctl[0-3] r,w,x,s;
  allow /dev/hw_random r,w,x,s;
  allow /dev/iio:device[0-9]+ r,w,x,s;
  allow /dev/input(/.*) r,w,s,x;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/mdm r,w,x,s;
  allow /dev/modem.* r,w,x,s;
  allow /dev/mpu r,w,x,s;
  allow /dev/mpuirq r,w,x,s;
  allow /dev/msm_aac.* r,w,s,x;
  allow /dev/msm_acdb r,w,s,x;
  allow /dev/msm_amrnb.* r,w,s,x;
  allow /dev/msm_amrwb.* r,w,s,x;
  allow /dev/msm_dsps r,w,x,s;
  allow /dev/msm_mp3 r,w,s,x;
  allow /dev/msm_rotator r,w,s,x;
  allow /dev/msm_rtac r,w,s,x;
  allow /dev/msm_vidc.* r,w,s,x;
  allow /dev/nvhdcp1 r,w,s,x;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /dev/qmi[0-2] r,w,x,s;
  allow /dev/rmnet_mux_ctrl r,w,x,s;
  allow /dev/rtc[0-9] r,w,x,s;
  allow /dev/sensors r,w,x,s;
  allow /dev/smd_sns_dsps r,w,x,s;
  allow /dev/smdcntl[0-7] r,w,x,s;
  allow /dev/snd/** r,w,s,x;
  allow /dev/socket/adbd r,w,s;
  allow /dev/socket/cryptd r,w,s;
  allow /dev/socket/gps r,w,s;
  allow /dev/socket/installd r,w,s;
  allow /dev/socket/lmkd r,w,s;
  allow /dev/socket/logdr r,w,s;
  allow /dev/socket/mdns r,w,s;
  allow /dev/socket/mpdecision/** r,w,s;
  allow /dev/socket/mtpd r,w,s;
  allow /dev/socket/netd r,w,s;
  allow /dev/socket/property_service r,w,s;
  allow /dev/socket/qmux_audio/** r,w,s;
  allow /dev/socket/qmux_bluetooth/** r,w,s;
  allow /dev/socket/qmux_gps/** r,w,s;
  allow /dev/socket/qmux_radio/** r,w,s;
  allow /dev/socket/racoon r,w,s;
  allow /dev/socket/sensor_ctl_socket r,w,s;
  allow /dev/socket/vold r,w,s;
  allow /dev/socket/wpa_eth[0-9] r,w,s;
  allow /dev/socket/wpa_wlan[0-9] r,w,s;
  allow /dev/socket/zygote r,w,s;
  allow /dev/socket/zygote_secondary r,w,s;
  allow /dev/spdif_out.* r,w,s,x;
  allow /dev/tegra.* r,w,s,x;
  allow /dev/ttyUSB0 r,w,x,s;
  allow /dev/tty[0-9]* r,w,x,s;
  allow /dev/tun r,w,x,s;
  allow /dev/usb_accessory r,w,x,s;
  allow /dev/video[0-9]* r,w,s,x;
  allow /dev/xt_qtaguid r,w,x,s;
  allow /mnt/asec/** r,w,s,x;
  allow /mnt/asec/[^/]+/[^/]+\.zip r,w,x,s;
  allow /mnt/asec/[^/]+/lib/** r,w,x,s;
  allow /mnt/expand/** r,w,s;
  allow /mnt/expand/[^/]+/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/[^/]+/oat/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/vmdl[^/]+\.tmp/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/vmdl[^/]+\.tmp/oat/** r,w,s,x;
  allow /mnt/expand/[^/]+/local/tmp/** r,w,s;
  allow /mnt/expand/[^/]+/media/** r,w,s;
  allow /mnt/runtime/** r,s;
  allow /mnt/user/** r,s;
  allow /odm/** r,x,s;
  allow /oem/** r,w,s,x;
  allow /persist/** r,w,s;
  allow /persist/wifi/** r,w,s,x;
  allow /proc/net/xt_qtaguid/ctrl r,w,x,s;
  allow /proc/sysrq-trigger r,w,x,s;
  allow /proc/uid_cputime/remove_uid_range r,w,x,s;
  allow /proc/uid_cputime/show_uid_stat r,w,x,s;
  allow /storage/** r,s;
  allow /sys/** r,w,x,s;
  allow /sys/devices/platform/nfc-power/nfc_power r,w,x,s;
  allow /sys/devices/system/cpu/** r,w,x,s;
  allow /sys/module/lowmemorykiller/** r,w,x,s;
  allow /sys/power/wake_lock r,w,x,s;
  allow /sys/power/wake_unlock r,w,x,s;
  allow /system/** r,x,s;
  allow /system/bin/app_process32 r,w,x,s;
  allow /system/bin/app_process64 r,w,x,s;
  allow /system/bin/logcat r,w,x,s;
  allow /system/bin/logwrapper r,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf r,x,s;
  allow /vendor/** r,x,s;
  allowbinder bluetooth c ;
  allowbinder drmserver c ;
  allowbinder drmserver t ;
  allowbinder dumpstate c ;
  allowbinder fingerprintd c ;
  allowbinder gatekeeperd c ;
  allowbinder healthd c ;
  allowbinder healthd t ;
  allowbinder inputflinger c ;
  allowbinder inputflinger t ;
  allowbinder isolated_app c ;
  allowbinder keystore c ;
  allowbinder mediaserver c ;
  allowbinder nfc c ;
  allowbinder platform_app c ;
  allowbinder radio c ;
  allowbinder servicemanager c ;
  allowbinder shared_relro c ;
  allowbinder shell c ;
  allowbinder su c ;
  allowbinder surfaceflinger c ;
  allowbinder system_app c ;
  allowbinder system_server c ;
  allowbinder untrusted_app c ;
  allowcom -ipc appdomain r; #allow system_server appdomain:fifo_file { read write getattr };
  allowcom -ipc appdomain r; #allow system_server appdomain:unix_stream_socket { read write getattr };
  allowcom -ipc appdomain w; #allow system_server appdomain:fifo_file { read write getattr };
  allowcom -ipc appdomain w; #allow system_server appdomain:unix_stream_socket { read write getattr };
  allowcom -ipc cache_file r; #allow system_server cache_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc cache_file w; #allow system_server cache_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc gpsd w; #allow system_server gpsd:unix_stream_socket connectto;
  allowcom -ipc init w; #allow system_server init:unix_stream_socket connectto;
  allowcom -ipc installd w; #allow system_server installd:unix_stream_socket connectto;
  allowcom -ipc lmkd w; #allow system_server lmkd:unix_stream_socket connectto;
  allowcom -ipc logd w; #allow system_server logd:unix_stream_socket connectto;
  allowcom -ipc mpdecision w; #allow system_server mpdecision:unix_dgram_socket sendto;
  allowcom -ipc mpdecision w; #allow system_server mpdecision:unix_stream_socket { connectto sendto };
  allowcom -ipc mtp w; #allow system_server mtp:unix_stream_socket connectto;
  allowcom -ipc netd w; #allow system_server netd:unix_stream_socket connectto;
  allowcom -ipc qmux w; #allow system_server qmux:unix_stream_socket connectto;
  allowcom -ipc racoon w; #allow system_server racoon:unix_stream_socket connectto;
  allowcom -ipc rild w; #allow system_server rild:unix_stream_socket connectto;
  allowcom -ipc sensors w; #allow system_server sensors:unix_dgram_socket sendto;
  allowcom -ipc sensors w; #allow system_server sensors:unix_stream_socket { connectto sendto };
  allowcom -ipc surfaceflinger r; #allow system_server surfaceflinger:unix_stream_socket { read write setopt };
  allowcom -ipc surfaceflinger w; #allow system_server surfaceflinger:unix_stream_socket { read write setopt };
  allowcom -ipc system_data_file r; #allow system_server system_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc system_data_file w; #allow system_server system_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc system_server r; #allow system_server system_server:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc system_server r; #allow system_server system_server:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc system_server r; #allow system_server system_server:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc system_server w; #allow system_server system_server:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc system_server w; #allow system_server system_server:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc system_server w; #allow system_server system_server:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc system_server_qmuxd_socket r; #allow system_server system_server_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc system_server_qmuxd_socket w; #allow system_server system_server_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc vold w; #allow system_server vold:unix_stream_socket connectto;
  allowcom -ipc wpa w; #allow system_server wpa:unix_dgram_socket sendto;
  allowcom -ipc zygote w; #allow system_server zygote:unix_dgram_socket write;
  allowcom -ipc zygote w; #allow system_server zygote:unix_stream_socket { connectto getopt getattr };
  allowcom -sig appdomain k; #allow system_server appdomain:process { setsched signal sigkill getsched };
  allowcom -sig appdomain o; #allow system_server appdomain:process { setsched signal sigkill getsched };
  allowcom -sig init c; #allow system_server init:process sigchld;
  allowcom -sig system_server c; #allow system_server system_server:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig system_server k; #allow system_server system_server:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig system_server n; #allow system_server system_server:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig system_server o; #allow system_server system_server:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig system_server s; #allow system_server system_server:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig zygote c; #allow system_server zygote:process { sigkill sigchld };
  allowcom -sig zygote k; #allow system_server zygote:process { sigkill sigchld };
  allowdev -root /dev;
  allowfs cgroup  w,r,s;
  allowfs proc_sysrq  r,s,w,x;
  allowfs proc_uid_cputime_removeuid  w,r,s,x;
  allowfs proc_uid_cputime_showstat  r,s,x,w;
  allowfs qtaguid_proc  r,s,w,x;
  allowfs selinuxfs  r,s,w,x;
  allowfs sysfs  r,s,w,x;
  allowks keystore l,i,u,g,s,a ;
  allownet -protocol raw use;
  allownet -protocol socket create;
  allownet -protocol socket rw;
  allowpriv cap2_block_suspend;
  allowpriv cap_net_admin;
  allowpriv cap_sys_boot;
  allowpriv cap_sys_nice;
  allowpriv cap_sys_resource;
  allowpriv cap_sys_time;
  allowpriv cap_sys_tty_config;
  allowpriv execmem;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv part_relabel;
  allowpriv ptrace;
  allowpriv relabel;
  allowpriv setsecurity;
  allowprop build.fingerprint ;
  allowprop ctl. ;
  allowprop ctl.bugreport ;
  allowprop ctl.dhcpcd_bt-pan ;
  allowprop debug. ;
  allowprop dev. ;
  allowprop dhcp. ;
  allowprop hw. ;
  allowprop net. ;
  allowprop net.cdma ;
  allowprop net.dns ;
  allowprop net.gprs ;
  allowprop net.lte ;
  allowprop net.ppp ;
  allowprop net.qmi ;
  allowprop net.rmnet ;
  allowprop persist.security. ;
  allowprop persist.service. ;
  allowprop persist.sys. ;
  allowprop runtime. ;
  allowprop selinux. ;
  allowprop service. ;
  allowprop sys. ;
  allowprop sys.powerctl ;
  allowprop sys.usb.config ;
  allowprop wlan. ;
  allowsvc -name system_server_service a,f ;
  allowsvc SurfaceFlinger f ;
  allowsvc android.hardware.fingerprint.IFingerprintDaemon f ;
  allowsvc android.security.keystore f ;
  allowsvc android.service.gatekeeper.IGateKeeperService f ;
  allowsvc batteryproperties f ;
  allowsvc batterypropreg f ;
  allowsvc carrier_config f ;
  allowsvc common_time.clock f ;
  allowsvc common_time.config f ;
  allowsvc display.qservice f ;
  allowsvc drm.drmManager f ;
  allowsvc ims f ;
  allowsvc iphonesubinfo f ;
  allowsvc iphonesubinfo2 f ;
  allowsvc iphonesubinfo_msim f ;
  allowsvc isms f ;
  allowsvc isms2 f ;
  allowsvc isms_msim f ;
  allowsvc isub f ;
  allowsvc media.audio_flinger f ;
  allowsvc media.audio_policy f ;
  allowsvc media.camera f ;
  allowsvc media.log f ;
  allowsvc media.player f ;
  allowsvc media.radio f ;
  allowsvc media.resource_manager f ;
  allowsvc media.sound_trigger_hw f ;
  allowsvc nfc f ;
  allowsvc phone f ;
  allowsvc phone1 f ;
  allowsvc phone2 f ;
  allowsvc phone_msim f ;
  allowsvc radio.phone f ;
  allowsvc radio.phonesubinfo f ;
  allowsvc radio.sms f ;
  allowsvc simphonebook f ;
  allowsvc simphonebook2 f ;
  allowsvc simphonebook_msim f ;
  allowsvc sip f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow system_server app_data_file:dir { read getattr search };" #path_list: 
  inline "allow system_server app_data_file:file { read write getattr };" #path_list: 
  inline "allow system_server cgroup:dir { remove_name rmdir };" #path_list: 
  inline "allow system_server debugfs:file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server domain:dir { read search ioctl open getattr };" #path_list: 
  inline "allow system_server domain:file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server domain:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server frp_block_device:blk_file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow system_server gps_control:file { read lock getattr write ioctl open append };"
  inline "allow system_server inputflinger:dir { read search ioctl open getattr };" #path_list: 
  inline "allow system_server inputflinger:file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server inputflinger:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server mediaserver:dir { read search ioctl open getattr };" #path_list: 
  inline "allow system_server mediaserver:file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server mediaserver:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server pstorefs:dir { read search ioctl open getattr };" #path_list: 
  inline "allow system_server pstorefs:file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server sdcard_type:dir { getattr search };" #path_list: 
  inline "allow system_server sdcardd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow system_server sdcardd:file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server sdcardd:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server selinuxfs:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow system_server surfaceflinger:dir { read search ioctl open getattr };" #path_list: 
  inline "allow system_server surfaceflinger:file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server surfaceflinger:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server system_app_data_file:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow system_server system_app_data_file:file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow system_server system_server:dir { read search ioctl open getattr };" #path_list: 
  inline "allow system_server system_server:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow system_server system_server:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server system_server_qmuxd_socket:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };"
  inline "allow system_server system_server_qmuxd_socket:file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow system_server system_server_qmuxd_socket:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow system_server system_server_qmuxd_socket:sock_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow system_server unlabeled:dir { read search ioctl open getattr };" #path_list: 
  inline "allow system_server unlabeled:file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_server zygote_tmpfs:file read;"
  inline "qmux_socket(system_server)"
  inline "type_transition system_server qmuxd_socket:dir system_server_qmuxd_socket;"
  inline "type_transition system_server qmuxd_socket:fifo_file system_server_qmuxd_socket;"
  inline "type_transition system_server qmuxd_socket:file system_server_qmuxd_socket;"
  inline "type_transition system_server qmuxd_socket:lnk_file system_server_qmuxd_socket;"
  inline "type_transition system_server qmuxd_socket:sock_file system_server_qmuxd_socket;"
  inline "type_transition system_server system_data_file:sock_file system_ndebug_socket "ndebugsocket";"
  inline "type_transition system_server wifi_data_file:sock_file system_wpa_socket;"
  inline "type_transition system_server wpa_socket:sock_file system_wpa_socket;"
}

