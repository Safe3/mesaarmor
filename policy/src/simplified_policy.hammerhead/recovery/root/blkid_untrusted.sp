{
domain_name blkid_untrusted;
  allow /dev/block/** s;
  allow /dev/block/vold/.+ r,w,x,s;
  allow /system/bin/blkid r,w,x,s;
  allow /system/bin/sh r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc blkid_untrusted r; #allow blkid_untrusted blkid_untrusted:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc blkid_untrusted r; #allow blkid_untrusted blkid_untrusted:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc blkid_untrusted r; #allow blkid_untrusted blkid_untrusted:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc blkid_untrusted w; #allow blkid_untrusted blkid_untrusted:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc blkid_untrusted w; #allow blkid_untrusted blkid_untrusted:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc blkid_untrusted w; #allow blkid_untrusted blkid_untrusted:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc vold r; #allow blkid_untrusted vold:fifo_file { read write getattr };
  allowcom -ipc vold w; #allow blkid_untrusted vold:fifo_file { read write getattr };
  allowcom -sig blkid_untrusted c; #allow blkid_untrusted blkid_untrusted:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig blkid_untrusted k; #allow blkid_untrusted blkid_untrusted:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig blkid_untrusted n; #allow blkid_untrusted blkid_untrusted:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig blkid_untrusted o; #allow blkid_untrusted blkid_untrusted:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig blkid_untrusted s; #allow blkid_untrusted blkid_untrusted:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig vold c; #allow blkid_untrusted vold:process sigchld;
  allowdev -root /dev;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  inline "allow blkid_untrusted blkid_untrusted:dir { read search ioctl open getattr };" #path_list: 
  inline "allow blkid_untrusted blkid_untrusted:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow blkid_untrusted blkid_untrusted:lnk_file { read lock ioctl open getattr };" #path_list: 
}

