{
domain_name vdc;
domain_trans dumpstate /system/bin/vdc;
domain_trans init /system/bin/vdc;
  allow /data/local/tmp/** r,w,s;
  allow /dev/socket/cryptd r,w,s;
  allow /dev/socket/vold r,w,s;
  allow /mnt/expand/[^/]+/local/tmp/** r,w,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/bin/vdc r,w,x,s;
  allowbinder su c ;
  allowcom -ipc dumpstate r; #allow vdc dumpstate:unix_dgram_socket { read write };
  allowcom -ipc dumpstate r; #allow vdc dumpstate:unix_stream_socket { read write getattr };
  allowcom -ipc dumpstate w; #allow vdc dumpstate:unix_dgram_socket { read write };
  allowcom -ipc dumpstate w; #allow vdc dumpstate:unix_stream_socket { read write getattr };
  allowcom -ipc vdc r; #allow vdc vdc:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc vdc r; #allow vdc vdc:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc vdc r; #allow vdc vdc:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc vdc w; #allow vdc vdc:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc vdc w; #allow vdc vdc:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc vdc w; #allow vdc vdc:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc vold w; #allow vdc vold:unix_stream_socket connectto;
  allowcom -sig dumpstate c; #allow vdc dumpstate:process sigchld;
  allowcom -sig init c; #allow vdc init:process sigchld;
  allowcom -sig vdc c; #allow vdc vdc:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig vdc k; #allow vdc vdc:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig vdc n; #allow vdc vdc:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig vdc o; #allow vdc vdc:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig vdc s; #allow vdc vdc:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow vdc vdc:dir { read search ioctl open getattr };" #path_list: 
  inline "allow vdc vdc:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow vdc vdc:lnk_file { read lock ioctl open getattr };" #path_list: 
}

