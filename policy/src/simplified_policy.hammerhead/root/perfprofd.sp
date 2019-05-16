{
domain_name perfprofd : mlstrustedsubject;
domain_trans init /system/xbin/perfprofd;
  allow /data/misc/perfprofd/** r,w,s,x;
  allow /dev/pmsg0 r,w,x,s;
  allow /dev/socket/logdr r,w,s;
  allow /dev/socket/logdw r,w,s;
  allow /dev/socket/property_service r,w,s;
  allow /odm/** r,w,x,s;
  allow /sys/devices/system/cpu/** r,w,x,s;
  allow /sys/power/wake_lock r,w,x,s;
  allow /sys/power/wake_unlock r,w,x,s;
  allow /system/** r,w,x,s;
  allow /system/bin/logcat r,w,x,s;
  allow /system/bin/logwrapper r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/perfprofd r,w,x,s;
  allow /system/xbin/simpleperf r,w,x,s;
  allow /vendor/** r,w,x,s;
  allowbinder su c ;
  allowcom -ipc init w; #allow perfprofd init:unix_stream_socket connectto;
  allowcom -ipc logd w; #allow perfprofd logd:unix_dgram_socket sendto;
  allowcom -ipc logd w; #allow perfprofd logd:unix_stream_socket connectto;
  allowcom -ipc perfprofd r; #allow perfprofd perfprofd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc perfprofd r; #allow perfprofd perfprofd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc perfprofd r; #allow perfprofd perfprofd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc perfprofd w; #allow perfprofd perfprofd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc perfprofd w; #allow perfprofd perfprofd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc perfprofd w; #allow perfprofd perfprofd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow perfprofd init:process sigchld;
  allowcom -sig perfprofd c; #allow perfprofd perfprofd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig perfprofd k; #allow perfprofd perfprofd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig perfprofd n; #allow perfprofd perfprofd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig perfprofd o; #allow perfprofd perfprofd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig perfprofd s; #allow perfprofd perfprofd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowpriv cap2_block_suspend;
  allowpriv cap_dac_override;
  allowpriv cap_ipc_lock;
  allowpriv cap_sys_admin;
  allowpriv cap_sys_resource;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv relabel;
  allowpriv setsecurity;
  allowprop ctl.mpdecision ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow perfprofd app_data_file:dir search;" #path_list: 
  inline "allow perfprofd app_data_file:file { read lock ioctl open getattr };" #path_list: 
  inline "allow perfprofd domain:dir { read search ioctl open getattr };" #path_list: 
  inline "allow perfprofd domain:file { read lock ioctl open getattr };" #path_list: 
  inline "allow perfprofd domain:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow perfprofd exec_type:file { read lock ioctl open getattr };" #path_list: 
  inline "allow perfprofd perfprofd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow perfprofd perfprofd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow perfprofd perfprofd:lnk_file { read lock ioctl open getattr };" #path_list: 
}

