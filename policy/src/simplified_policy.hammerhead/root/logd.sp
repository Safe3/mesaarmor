{
domain_name logd : mlstrustedsubject;
domain_trans init /system/bin/logcat;
domain_trans init /system/bin/logd;
  allow /data/** r,w,x,s;
  allow /data/misc/logd/** r,w,s,x;
  allow /dev/kmsg r,w,x,s;
  allow /dev/socket/logd r,w,s;
  allow /dev/socket/logdr r,w,s;
  allow /mnt/expand/[^/]+/** r,w,x,s;
  allow /system/bin/logcat r,w,x,s;
  allow /system/bin/logd r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc logd r; #allow logd logd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc logd r; #allow logd logd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc logd r; #allow logd logd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc logd w; #allow logd logd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc logd w; #allow logd logd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc logd w; #allow logd logd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow logd init:process sigchld;
  allowcom -sig logd c; #allow logd logd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig logd k; #allow logd logd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig logd n; #allow logd logd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig logd o; #allow logd logd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig logd s; #allow logd logd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowpriv audit_adm;
  allowpriv cap2_syslog;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv cap_sys_nice;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv klog_adm;
  allowpriv klog_read;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow logd domain:dir { read search ioctl open getattr };" #path_list: 
  inline "allow logd domain:file { read lock ioctl open getattr };" #path_list: 
  inline "allow logd domain:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow logd logd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow logd logd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow logd logd:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow logd pstorefs:dir search;" #path_list: 
  inline "allow logd pstorefs:file { read lock ioctl open getattr };" #path_list: 
}

