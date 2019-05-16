{
domain_name adbd : netdomain,mlstrustedsubject;
  
  allow / r,w,x,s;
  allow /adb_keys r,w,x,s;
  allow /charger r,w,x,s;
  allow /data/adb/** r,w,s,x;
  allow /data/anr/** r,w,s,x;
  allow /data/bootchart/** r,w,x,s;
  allow /data/local/tmp/** r,w,s,x;
  allow /data/misc/adb/** r,w,x,s;
  allow /default\.prop r,w,x,s;
  allow /dev/android_adb.* r,w,x,s;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/pts r,w,x,s;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /dev/socket/property_service r,w,s;
  allow /dev/usb-ffs/adb r,w,x,s;
  allow /file_contexts r,w,x,s;
  allow /fstab\..* r,w,x,s;
  allow /init\..* r,w,x,s;
  allow /lost\+found r,w,x,s;
  allow /mnt/expand/[^/]+/local/tmp/** r,w,s,x;
  allow /mnt/runtime/** r,w,s;
  allow /mnt/user/** r,w,s;
  allow /odm/** r,w,x,s;
  allow /proc r,w,x,s;
  allow /property_contexts r,w,x,s;
  allow /res/** r,w,x,s;
  allow /sbin/** r,w,x,s;
  allow /seapp_contexts r,w,x,s;
  allow /sepolicy r,w,x,s;
  allow /storage/** r,w,s;
  allow /system/** r,w,x,s;
  allow /system/bin/app_process32 r,w,x,s;
  allow /system/bin/app_process64 r,w,x,s;
  allow /system/bin/logwrapper r,w,x,s;
  allow /system/bin/sh r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf r,w,x,s;
  allow /ueventd\..* r,w,x,s;
  allow /vendor/** r,w,x,s;
  allowbinder servicemanager c ;
  allowbinder su c ;
  allowbinder surfaceflinger c ;
  allowcom -ipc adbd r; #allow adbd adbd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc adbd r; #allow adbd adbd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc adbd r; #allow adbd adbd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc adbd w; #allow adbd adbd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc adbd w; #allow adbd adbd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc adbd w; #allow adbd adbd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc appdomain w; #allow adbd appdomain:unix_stream_socket connectto;
  allowcom -ipc init w; #allow adbd init:unix_stream_socket connectto;
  allowcom -sig adbd c; #allow adbd adbd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig adbd k; #allow adbd adbd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig adbd n; #allow adbd adbd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig adbd o; #allow adbd adbd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig adbd s; #allow adbd adbd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig init c; #allow adbd init:process sigchld;
  allowdev -pts devpts r;
allowdev -pts devpts w;

  allowdev -root /dev;
  allownet -protocol raw use;
  allowpriv cap_setgid;
  allowpriv cap_setpcap;
  allowpriv cap_setuid;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowprop log. ;
  allowprop security.perf_harden ;
  allowprop service.adb.root ;
  allowprop service.adb.tcp.port ;
  allowprop sys.powerctl ;
  allowprop sys.usb.ffs. ;
  allowsvc SurfaceFlinger f ;
  allowsvc display.qservice f ;
  inline "allow adbd adbd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow adbd adbd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow adbd adbd:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow adbd app_data_file:dir search;" #path_list: 
  inline "allow adbd app_data_file:sock_file write;" #path_list: 
  inline "allow adbd rootfs:file { read open getattr entrypoint execute };"
  inline "allow adbd sdcard_type:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow adbd sdcard_type:file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow adbd shell:process transition;"
}

