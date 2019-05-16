{
domain_name dex2oat;
domain_trans installd /system/bin/dex2oat;
domain_trans installd /system/bin/patchoat;
  allow /data/app/[^/]+/oat/** r,w,s;
  allow /data/app/vmdl[^/]+\.tmp/** r,s;
  allow /data/app/vmdl[^/]+\.tmp/oat/** r,w,s;
  allow /data/dalvik-cache/** r,w,s;
  allow /mnt/asec/** r,s;
  allow /mnt/expand/[^/]+/app/[^/]+/oat/** r,w,s;
  allow /mnt/expand/[^/]+/app/vmdl[^/]+\.tmp/** r,s;
  allow /mnt/expand/[^/]+/app/vmdl[^/]+\.tmp/oat/** r,w,s;
  allow /oem/** r,s;
  allow /system/bin/dex2oat r,w,x,s;
  allow /system/bin/patchoat r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc dex2oat r; #allow dex2oat dex2oat:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc dex2oat r; #allow dex2oat dex2oat:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc dex2oat r; #allow dex2oat dex2oat:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc dex2oat w; #allow dex2oat dex2oat:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc dex2oat w; #allow dex2oat dex2oat:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc dex2oat w; #allow dex2oat dex2oat:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig dex2oat c; #allow dex2oat dex2oat:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig dex2oat k; #allow dex2oat dex2oat:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig dex2oat n; #allow dex2oat dex2oat:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig dex2oat o; #allow dex2oat dex2oat:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig dex2oat s; #allow dex2oat dex2oat:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig installd c; #allow dex2oat installd:process sigchld;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  inline "allow dex2oat dex2oat:dir { read search ioctl open getattr };" #path_list: 
  inline "allow dex2oat dex2oat:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow dex2oat dex2oat:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow dex2oat unlabeled:file read;" #path_list: 
}

