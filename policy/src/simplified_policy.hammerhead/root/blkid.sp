{
domain_name blkid;
  allow /dev/block/** s;
  allow /dev/block/dm-[0-9]+ r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/userdata r,w,x,s;
  allow /dev/device-mapper r,w,x,s;
  allow /system/bin/blkid r,w,x,s;
  allow /system/bin/sh r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc blkid r; #allow blkid blkid:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc blkid r; #allow blkid blkid:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc blkid r; #allow blkid blkid:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc blkid w; #allow blkid blkid:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc blkid w; #allow blkid blkid:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc blkid w; #allow blkid blkid:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc vold r; #allow blkid vold:fifo_file { read write getattr };
  allowcom -ipc vold w; #allow blkid vold:fifo_file { read write getattr };
  allowcom -sig blkid c; #allow blkid blkid:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig blkid k; #allow blkid blkid:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig blkid n; #allow blkid blkid:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig blkid o; #allow blkid blkid:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig blkid s; #allow blkid blkid:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig vold c; #allow blkid vold:process sigchld;
  allowdev -root /dev;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  inline "allow blkid blkid:dir { read search ioctl open getattr };" #path_list: 
  inline "allow blkid blkid:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow blkid blkid:lnk_file { read lock ioctl open getattr };" #path_list: 
}

