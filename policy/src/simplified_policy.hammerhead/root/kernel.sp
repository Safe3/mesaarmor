{
domain_name kernel : mlstrustedsubject;
  allow /data/app-asec/** r,s;
  allow /init r,w,x,s;
  allow /proc/sysrq-trigger r,w,x,s;
  allowbinder su c ;
  allowcom -ipc kernel r; #allow kernel kernel:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc kernel r; #allow kernel kernel:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc kernel r; #allow kernel kernel:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc kernel w; #allow kernel kernel:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc kernel w; #allow kernel kernel:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc kernel w; #allow kernel kernel:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig kernel c; #allow kernel kernel:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig kernel k; #allow kernel kernel:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig kernel n; #allow kernel kernel:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig kernel o; #allow kernel kernel:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig kernel s; #allow kernel kernel:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowfs proc_sysrq  w,r,s,x;
  allowfs selinuxfs  w,r,s;
  allowfs tmpfs  w,r,s;
  allowfs usbfs  s;
  allowpriv cap_sys_boot;
  allowpriv cap_sys_nice;
  allowpriv cap_sys_resource;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv mount;
  allowpriv part_relabel;
  allowpriv relabel;
  allowpriv setcheckreqprot;
  allowpriv setsecurity;
  inline "allow kernel app_data_file:file read;" #path_list: 
  inline "allow kernel init:process transition;"
  inline "allow kernel kernel:dir { read search ioctl open getattr };"
  inline "allow kernel kernel:file { read lock getattr write ioctl open append };"
  inline "allow kernel kernel:lnk_file { read lock ioctl open getattr };"
  inline "allow kernel sdcard_type:file { read write };" #path_list: 
  inline "allow kernel selinuxfs:file write;" #path_list: 
  inline "allow kernel tmpfs:chr_file write;"
  inline "allow kernel unlabeled:dir search;" #path_list: 
  inline "allow kernel usbfs:dir search;"
}

