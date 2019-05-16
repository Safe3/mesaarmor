{
domain_name ueventd;
  allow /data/misc/wifi/** r,w,s,x;
  allow /data/security/** r,w,s,x;
  allow /dev/** r,w,s,x;
  allow /dev/__kmsg__ r,w,x,s;
  allow /efs/** r,w,x,s;
  allow /init r,w,x,s;
  allow /sys/** r,w,s,x;
  allow /sys/devices/system/cpu/** r,w,x,s;
  allow /sys/devices/virtual/smdpkt/smdcntl([0-9])+/open_timeout r,w,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc ueventd r; #allow ueventd ueventd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc ueventd r; #allow ueventd ueventd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc ueventd r; #allow ueventd ueventd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc ueventd w; #allow ueventd ueventd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc ueventd w; #allow ueventd ueventd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc ueventd w; #allow ueventd ueventd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow ueventd init:process sigchld;
  allowcom -sig ueventd c; #allow ueventd ueventd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setfscreate signull setrlimit };
  allowcom -sig ueventd k; #allow ueventd ueventd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setfscreate signull setrlimit };
  allowcom -sig ueventd n; #allow ueventd ueventd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setfscreate signull setrlimit };
  allowcom -sig ueventd o; #allow ueventd ueventd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setfscreate signull setrlimit };
  allowcom -sig ueventd s; #allow ueventd ueventd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setfscreate signull setrlimit };
  allowdev -root /dev;
  allowfs sysfs  r,s,w,x;
  allowfs tmpfs  r,s,w,x;
  allowpriv cap_chown;
  allowpriv cap_dac_override;
  allowpriv cap_fowner;
  allowpriv cap_fsetid;
  allowpriv cap_net_admin;
  allowpriv cap_setgid;
  allowpriv cap_sys_rawio;
  allowpriv devcreate;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv part_relabel;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow ueventd dev_type:blk_file { create unlink setattr };" #path_list: 
  inline "allow ueventd dev_type:chr_file { create unlink setattr };" #path_list: 
  inline "allow ueventd dev_type:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow ueventd dev_type:lnk_file { create unlink };" #path_list: 
  inline "allow ueventd f_init : file entrypoint;"
  inline "allow ueventd firmware_file:dir { read search ioctl open getattr };" #path_list: 
  inline "allow ueventd firmware_file:file { read lock ioctl open getattr };" #path_list: 
  inline "allow ueventd tmpfs:chr_file { read lock getattr write ioctl open append };"
  inline "allow ueventd ueventd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow ueventd ueventd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow ueventd ueventd:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "type_transition ueventd device:chr_file klog_device "__kmsg__";"
}

