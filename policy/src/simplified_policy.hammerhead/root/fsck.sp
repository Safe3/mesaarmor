{
domain_name fsck;
domain_trans init /system/bin/fsck_msdos;
domain_trans init /system/bin/e2fsck;
domain_trans init /system/bin/fsck\.f2fs;
  allow /dev/block/** s;
  allow /dev/block/dm-[0-9]+ r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/cache r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/userdata r,w,x,s;
  allow /dev/device-mapper r,w,x,s;
  allow /dev/pts r,w,s;
  allow /system/bin/e2fsck r,w,x,s;
  allow /system/bin/fsck\.f2fs r,w,x,s;
  allow /system/bin/fsck_msdos r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc fsck r; #allow fsck fsck:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc fsck r; #allow fsck fsck:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc fsck r; #allow fsck fsck:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc fsck w; #allow fsck fsck:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc fsck w; #allow fsck fsck:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc fsck w; #allow fsck fsck:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc vold r; #allow fsck vold:fifo_file { read write getattr };
  allowcom -ipc vold w; #allow fsck vold:fifo_file { read write getattr };
  allowcom -sig fsck c; #allow fsck fsck:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig fsck k; #allow fsck fsck:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig fsck n; #allow fsck fsck:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig fsck o; #allow fsck fsck:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig fsck s; #allow fsck fsck:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig init c; #allow fsck init:process sigchld;
  allowcom -sig vold c; #allow fsck vold:process sigchld;
  allowdev -pts devpts r;
allowdev -pts devpts w;

  allowdev -root /dev;
  allowfs tmpfs  r,s,w;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow fsck fsck:dir { read search ioctl open getattr };" #path_list: 
  inline "allow fsck fsck:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow fsck fsck:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow fsck tmpfs:chr_file { read write ioctl };"
}

