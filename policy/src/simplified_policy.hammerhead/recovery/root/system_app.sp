{
domain_name system_app : appdomain,binderservicedomain,netdomain;
domain_trans zygote;
  
  allow /data/** r,w,s,x;
  allow /data/anr/** r,w,s,x;
  allow /data/misc/keychain/** r,w,s,x;
  allow /data/misc/user/** r,w,s,x;
  allow /data/system/users/[0-9]+/wallpaper r,w,x,s;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /dev/socket/logd r,w,s;
  allow /dev/socket/property_service r,w,s;
  allow /mnt/asec/** r,w,x,s;
  allow /mnt/expand/[^/]+/** r,w,s,x;
  allow /mnt/media_rw/** s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder keystore c ;
  allowbinder su c ;
  allowcom -ipc app_data_file r; #allow system_app app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc app_data_file w; #allow system_app app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc init w; #allow system_app init:unix_stream_socket connectto;
  allowcom -ipc logd w; #allow system_app logd:unix_stream_socket connectto;
  allowcom -ipc system_app r; #allow system_app system_app:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc system_app r; #allow system_app system_app:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc system_app r; #allow system_app system_app:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc system_app w; #allow system_app system_app:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc system_app w; #allow system_app system_app:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc system_app w; #allow system_app system_app:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig system_app c; #allow system_app system_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig system_app k; #allow system_app system_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig system_app n; #allow system_app system_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig system_app o; #allow system_app system_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig system_app s; #allow system_app system_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowdev -root /dev;
  allowks keystore l,i,u,g,s ;
  allownet -protocol raw use;
  allowpriv execmem;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv ptrace;
  allowpriv relabel;
  allowpriv setsecurity;
  allowprop ctl.bugreport ;
  allowprop debug. ;
  allowprop dev. ;
  allowprop hw. ;
  allowprop net. ;
  allowprop net.cdma ;
  allowprop net.dns ;
  allowprop net.gprs ;
  allowprop net.lte ;
  allowprop net.ppp ;
  allowprop net.qmi ;
  allowprop net.rmnet ;
  allowprop persist.logd. ;
  allowprop persist.security. ;
  allowprop persist.service. ;
  allowprop persist.sys. ;
  allowprop runtime. ;
  allowprop service. ;
  allowprop sys. ;
  allowprop sys.usb.config ;
  allowprop wlan. ;
  allowsvc -name service_manager_type f ;
  allowsvc -name servicemanager l ;
  allowsvc android.security.keystore f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow system_app app_data_file:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow system_app app_data_file:file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow system_app app_data_file:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow system_app app_data_file:sock_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow system_app system_app:dir { read search ioctl open getattr };" #path_list: 
  inline "allow system_app system_app:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow system_app system_app:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow system_app system_app_data_file:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow system_app system_app_data_file:file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow system_app system_app_data_file:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
}

