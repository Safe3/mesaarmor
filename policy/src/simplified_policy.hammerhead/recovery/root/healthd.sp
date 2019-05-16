{
domain_name healthd : binderservicedomain;
  allow / r,w,x,s;
  allow /charger r,w,x,s;
  allow /default\.prop r,w,x,s;
  allow /dev/adf-interface[0-9]*\.[0-9]* r,w,s,x;
  allow /dev/adf-overlay-engine[0-9]*\.[0-9]* r,w,s,x;
  allow /dev/adf[0-9]* r,w,s,x;
  allow /dev/ashmem r,x,s;
  allow /dev/graphics/** r,w,s,x;
  allow /dev/input(/.*) r,w,s,x;
  allow /dev/kmsg r,w,x,s;
  allow /dev/socket/property_service r,w,s;
  allow /dev/tty[0-9]* r,w,x,s;
  allow /file_contexts r,w,x,s;
  allow /fstab\..* r,w,x,s;
  allow /init\..* r,w,x,s;
  allow /lost\+found r,w,x,s;
  allow /proc r,w,x,s;
  allow /proc/sysrq-trigger r,w,x,s;
  allow /property_contexts r,w,x,s;
  allow /res/** r,w,x,s;
  allow /sbin/** r,w,x,s;
  allow /seapp_contexts r,w,x,s;
  allow /sepolicy r,w,x,s;
  allow /sys/** r,w,s;
  allow /sys/power/wake_lock r,w,x,s;
  allow /sys/power/wake_unlock r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /ueventd\..* r,w,x,s;
  allowbinder servicemanager c ;
  allowbinder su c ;
  allowbinder system_server c ;
  allowbinder vold t ;
  allowcom -ipc healthd r; #allow healthd healthd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc healthd r; #allow healthd healthd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc healthd r; #allow healthd healthd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc healthd w; #allow healthd healthd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc healthd w; #allow healthd healthd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc healthd w; #allow healthd healthd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc init w; #allow healthd init:unix_stream_socket connectto;
  allowcom -sig healthd c; #allow healthd healthd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowcom -sig healthd k; #allow healthd healthd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowcom -sig healthd n; #allow healthd healthd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowcom -sig healthd o; #allow healthd healthd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowcom -sig healthd s; #allow healthd healthd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowcom -sig init c; #allow healthd init:process sigchld;
  allowdev -root /dev;
  allowfs proc_sysrq  r,s,w,x;
  allowfs sysfs  w,r,s;
  allowpriv cap2_block_suspend;
  allowpriv cap_net_admin;
  allowpriv cap_sys_boot;
  allowpriv cap_sys_tty_config;
  allowpriv execmem;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv setsecurity;
  allowprop dev. ;
  allowprop hw. ;
  allowprop net. ;
  allowprop persist.security. ;
  allowprop persist.service. ;
  allowprop persist.sys. ;
  allowprop runtime. ;
  allowprop service. ;
  allowprop sys. ;
  allowprop wlan. ;
  allowsvc batteryproperties a,f ;
  allowsvc batterypropreg a,f ;
  inline "allow healthd healthd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow healthd healthd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow healthd healthd:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow healthd pstorefs:dir { read search ioctl open getattr };" #path_list: 
  inline "allow healthd pstorefs:file { read lock ioctl open getattr };" #path_list: 
  inline "allow healthd rootfs:file { read open getattr entrypoint execute };"
}

