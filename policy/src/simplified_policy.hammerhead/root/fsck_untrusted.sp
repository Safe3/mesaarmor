{
domain_name fsck_untrusted;
  allow /dev/block/** s;
  allow /dev/block/vold/.+ r,w,x,s;
  allow /dev/pts r,w,s;
  allow /system/bin/e2fsck r,w,x,s;
  allow /system/bin/fsck\.f2fs r,w,x,s;
  allow /system/bin/fsck_msdos r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc fsck_untrusted r; #allow fsck_untrusted fsck_untrusted:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc fsck_untrusted r; #allow fsck_untrusted fsck_untrusted:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc fsck_untrusted r; #allow fsck_untrusted fsck_untrusted:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc fsck_untrusted w; #allow fsck_untrusted fsck_untrusted:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc fsck_untrusted w; #allow fsck_untrusted fsck_untrusted:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc fsck_untrusted w; #allow fsck_untrusted fsck_untrusted:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc vold r; #allow fsck_untrusted vold:fifo_file { read write getattr };
  allowcom -ipc vold w; #allow fsck_untrusted vold:fifo_file { read write getattr };
  allowcom -sig fsck_untrusted c; #allow fsck_untrusted fsck_untrusted:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig fsck_untrusted k; #allow fsck_untrusted fsck_untrusted:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig fsck_untrusted n; #allow fsck_untrusted fsck_untrusted:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig fsck_untrusted o; #allow fsck_untrusted fsck_untrusted:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig fsck_untrusted s; #allow fsck_untrusted fsck_untrusted:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig vold c; #allow fsck_untrusted vold:process sigchld;
  allowdev -pts devpts r;
allowdev -pts devpts w;

  allowdev -root /dev;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  inline "allow fsck_untrusted fsck_untrusted:dir { read search ioctl open getattr };" #path_list: 
  inline "allow fsck_untrusted fsck_untrusted:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow fsck_untrusted fsck_untrusted:lnk_file { read lock ioctl open getattr };" #path_list: 
}

