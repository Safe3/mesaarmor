{
domain_name gpsd : netdomain;
domain_trans init /system/vendor/bin/gpsd;
domain_trans init /vendor/bin/gpsd;
  
  allow /data/gps/** r,w,s,x;
  allow /dev/mpu r,w,x,s;
  allow /dev/mpuirq r,w,x,s;
  allow /dev/socket/gps r,w,s;
  allow /odm/** r,w,x,s;
  allow /sys/** r,w,x,s;
  allow /system/** r,w,x,s;
  allow /system/bin/logwrapper r,w,x,s;
  allow /system/bin/sh r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/vendor/bin/gpsd r,w,x,s;
  allow /system/xbin/simpleperf r,w,x,s;
  allow /vendor/** r,w,x,s;
  allow /vendor/bin/gpsd r,w,x,s;
  allowbinder su c ;
  allowcom -ipc gps_data_file r; #allow gpsd gps_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc gps_data_file w; #allow gpsd gps_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc gpsd r; #allow gpsd gpsd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc gpsd r; #allow gpsd gpsd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc gpsd r; #allow gpsd gpsd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc gpsd w; #allow gpsd gpsd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc gpsd w; #allow gpsd gpsd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc gpsd w; #allow gpsd gpsd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig gpsd c; #allow gpsd gpsd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig gpsd k; #allow gpsd gpsd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig gpsd n; #allow gpsd gpsd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig gpsd o; #allow gpsd gpsd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig gpsd s; #allow gpsd gpsd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig init c; #allow gpsd init:process sigchld;
  allowdev -root /dev;
  allowfs sysfs  r,s,w,x;
  allownet -protocol raw use;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow gpsd gpsd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow gpsd gpsd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow gpsd gpsd:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "type_transition gpsd gps_data_file:sock_file gps_socket;"
}

