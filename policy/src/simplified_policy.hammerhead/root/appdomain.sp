{
superdomain appdomain;

allow /cache/.*\.data r,w,s;
allow /cache/.*\.restore r,w,s;
allow /cache/backup/** r,w,s;
allow /data/** r,w,m,s,x;
allow /data/anr/** r,w,x,s;
allow /data/app/** r,w,m,s,x;
allow /data/app/[^/]+/oat/** r,w,s,x;
allow /data/app/vmdl[^/]+\.tmp/oat/** r,w,s,x;
allow /data/backup/** r,w,s;
allow /data/dalvik-cache/** r,w,s,x;
allow /data/dalvik-cache/profiles/** r,w,x,s;
allow /data/local/tmp/** r,w,s;
allow /data/media/** r,s;
allow /data/misc/keychain/** r,w,s,x;
allow /data/misc/shared_relro/** r,w,x,s;
allow /data/misc/sms/** r,w,s;
allow /data/misc/user/** r,w,s,x;
allow /data/resource-cache/** r,w,s,x;
allow /data/secure/backup/** r,w,s;
allow /data/system/heapdump/** r,w,s;
allow /data/system/users/[0-9]+/wallpaper r,w,s;
allow /dev/ashmem r,x,s;
allow /dev/bus/usb(.*)? r,w,s;
allow /dev/console r,w,s;
allow /dev/pts r,w,s;
allow /dev/socket/logd r,w,s;
allow /dev/socket/logdr r,w,s;
allow /dev/usb_accessory r,w,s;
allow /dev/xt_qtaguid r,w,x,s;
allow /mnt/expand/** r,w,s;
allow /mnt/expand/[^/]+/** r,w,m,s,x;
allow /mnt/expand/[^/]+/app/** r,w,m,s,x;
allow /mnt/expand/[^/]+/app/[^/]+/oat/** r,w,s,x;
allow /mnt/expand/[^/]+/app/vmdl[^/]+\.tmp/oat/** r,w,s,x;
allow /mnt/expand/[^/]+/local/tmp/** r,w,s;
allow /mnt/expand/[^/]+/media/** r,s;
allow /mnt/runtime/** r,w,s;
allow /mnt/user/** r,w,s;
allow /odm/** r,w,x,s;
allow /oem/** r,w,s,x;
allow /proc/net/xt_qtaguid/ctrl r,w,x,s;
allow /storage/** r,w,s;
allow /system/** r,w,x,s;
allow /system/bin/app_process32 r,w,x,s;
allow /system/bin/app_process64 r,w,x,s;
allow /system/bin/dex2oat r,w,x,s;
allow /system/bin/logcat r,w,x,s;
allow /system/bin/logwrapper r,w,x,s;
allow /system/bin/patchoat r,w,x,s;
allow /system/bin/run-as r,s;
allow /system/bin/sh r,w,x,s;
allow /system/xbin/simpleperf r,w,x,s;
allow /vendor/** r,w,x,s;
allowbinder bluetooth c ;
allowbinder drmserver c ;
allowbinder drmserver t ;
allowbinder dumpstate t ;
allowbinder gatekeeperd c ;
allowbinder healthd c ;
allowbinder inputflinger c ;
allowbinder isolated_app c ;
allowbinder keystore c ;
allowbinder mediaserver c ;
allowbinder mediaserver t ;
allowbinder nfc c ;
allowbinder platform_app c ;
allowbinder radio c ;
allowbinder servicemanager c ;
allowbinder shared_relro c ;
allowbinder shell c ;
allowbinder su c ;
allowbinder surfaceflinger c ;
allowbinder surfaceflinger t ;
allowbinder system_app c ;
allowbinder system_server c ;
allowbinder system_server t ;
allowbinder untrusted_app c ;
allowcom -ipc appdomain r; #allow appdomain appdomain:fifo_file { read lock getattr write ioctl open append };
allowcom -ipc appdomain r; #allow appdomain appdomain:unix_stream_socket { read write getattr shutdown getopt };
allowcom -ipc appdomain w; #allow appdomain appdomain:fifo_file { read lock getattr write ioctl open append };
allowcom -ipc appdomain w; #allow appdomain appdomain:unix_stream_socket { read write getattr shutdown getopt };
allowcom -ipc dumpstate r; #allow appdomain dumpstate:unix_stream_socket { read write getattr shutdown getopt };
allowcom -ipc dumpstate w; #allow appdomain dumpstate:unix_stream_socket { read write getattr shutdown getopt };
allowcom -ipc logd w; #allow appdomain logd:unix_stream_socket connectto;
allowcom -ipc surfaceflinger r; #allow appdomain surfaceflinger:unix_stream_socket { setopt read write getattr shutdown getopt };
allowcom -ipc surfaceflinger w; #allow appdomain surfaceflinger:unix_stream_socket { setopt read write getattr shutdown getopt };
allowcom -ipc system_server r; #allow appdomain system_server:fifo_file { read lock getattr write ioctl open append };
allowcom -ipc system_server r; #allow appdomain system_server:unix_stream_socket { setopt read write getattr shutdown getopt };
allowcom -ipc system_server w; #allow appdomain system_server:fifo_file { read lock getattr write ioctl open append };
allowcom -ipc system_server w; #allow appdomain system_server:unix_stream_socket { setopt read write getattr shutdown getopt };
allowcom -ipc zygote w; #allow appdomain zygote:fifo_file write;
allowcom -ipc zygote w; #allow appdomain zygote:unix_dgram_socket write;
allowcom -sig adbd c; #allow appdomain adbd:process sigchld;
allowcom -sig shell c; #allow appdomain shell:process sigchld;
allowcom -sig zygote c; #allow appdomain zygote:process sigchld;
allowdev -pts devpts r;
allowdev -pts devpts w;

allowdev -root /dev;
allowfs fuse  w,r,s,x;
allowfs fuse  w,r,s;
allowfs qtaguid_proc  r,s,w,x;
allowfs selinuxfs  r,s,w,x;
allowfs vfat  r,s,w,x;
allowfs vfat  s,r,w;
allowpriv getsecurity;
allowpriv relabel;
allowpriv setsecurity;
inline "allow appdomain fuse:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };"
inline "allow appdomain fuse:file { rename setattr read lock create getattr write ioctl unlink open append };"
inline "allow appdomain selinuxfs:file { read lock getattr write ioctl open append };" #path_list: 
inline "allow appdomain vfat:dir { read search ioctl open getattr };"
inline "allow appdomain vfat:file { read lock getattr write ioctl open append };"
inline "allow appdomain zygote_tmpfs:file read;"
}

