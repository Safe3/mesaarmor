{
domain_name mpdecision;
domain_trans init /system/bin/mpdecision;
  allow /dev/socket/** r,w,s;
  allow /dev/socket/mpdecision/** r,w,s;
  allow /sys/** r,w,s;
  allow /sys/devices/system/cpu/** r,w,x,s;
  allow /sys/module/pm2/modes/** r,w,s,x;
  allow /sys/module/pm_8x60/modes/** r,w,s,x;
  allow /system/bin/mpdecision r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc mpdecision r; #allow mpdecision mpdecision:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc mpdecision r; #allow mpdecision mpdecision:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc mpdecision r; #allow mpdecision mpdecision:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc mpdecision w; #allow mpdecision mpdecision:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc mpdecision w; #allow mpdecision mpdecision:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc mpdecision w; #allow mpdecision mpdecision:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow mpdecision init:process sigchld;
  allowcom -sig mpdecision c; #allow mpdecision mpdecision:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig mpdecision k; #allow mpdecision mpdecision:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig mpdecision n; #allow mpdecision mpdecision:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig mpdecision o; #allow mpdecision mpdecision:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig mpdecision s; #allow mpdecision mpdecision:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowfs sysfs  w,r,s;
  allowpriv cap_chown;
  allowpriv cap_dac_override;
  allowpriv cap_net_admin;
  allowpriv cap_sys_nice;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow mpdecision mediaserver:dir { read search ioctl open getattr };" #path_list: 
  inline "allow mpdecision mediaserver:file { read lock ioctl open getattr };" #path_list: 
  inline "allow mpdecision mediaserver:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow mpdecision mpdecision:dir { read search ioctl open getattr };" #path_list: 
  inline "allow mpdecision mpdecision:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow mpdecision mpdecision:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow mpdecision system_server:dir { read search ioctl open getattr };" #path_list: 
  inline "allow mpdecision system_server:file { read lock ioctl open getattr };" #path_list: 
  inline "allow mpdecision system_server:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "type_transition mpdecision socket_device:sock_file mpdecision_socket;"
}

