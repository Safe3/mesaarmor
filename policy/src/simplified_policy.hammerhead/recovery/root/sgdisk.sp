{
domain_name sgdisk;
domain_trans vold /system/bin/sgdisk;
  allow /dev/block/** s;
  allow /dev/block/vold/.+ r,w,x,s;
  allow /dev/pts r,w,s;
  allow /system/bin/sgdisk r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc sgdisk r; #allow sgdisk sgdisk:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc sgdisk r; #allow sgdisk sgdisk:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc sgdisk r; #allow sgdisk sgdisk:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc sgdisk w; #allow sgdisk sgdisk:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc sgdisk w; #allow sgdisk sgdisk:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc sgdisk w; #allow sgdisk sgdisk:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc vold r; #allow sgdisk vold:fifo_file { read write getattr };
  allowcom -ipc vold w; #allow sgdisk vold:fifo_file { read write getattr };
  allowcom -sig sgdisk c; #allow sgdisk sgdisk:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig sgdisk k; #allow sgdisk sgdisk:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig sgdisk n; #allow sgdisk sgdisk:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig sgdisk o; #allow sgdisk sgdisk:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig sgdisk s; #allow sgdisk sgdisk:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig vold c; #allow sgdisk vold:process sigchld;
  allowdev -pts devpts r;
allowdev -pts devpts w;

  allowdev -root /dev;
  allowpriv cap_sys_admin;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  inline "allow sgdisk sgdisk:dir { read search ioctl open getattr };" #path_list: 
  inline "allow sgdisk sgdisk:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow sgdisk sgdisk:lnk_file { read lock ioctl open getattr };" #path_list: 
}

