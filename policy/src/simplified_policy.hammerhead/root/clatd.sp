{
domain_name clatd : netdomain;
domain_trans netd /system/bin/clatd;
  
  allow /dev/tun r,w,x,s;
  allow /system/bin/clatd r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc clatd r; #allow clatd clatd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc clatd r; #allow clatd clatd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc clatd r; #allow clatd clatd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc clatd w; #allow clatd clatd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc clatd w; #allow clatd clatd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc clatd w; #allow clatd clatd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc netd r; #allow clatd netd:fifo_file { read write };
  allowcom -ipc netd r; #allow clatd netd:unix_dgram_socket { read write };
  allowcom -ipc netd r; #allow clatd netd:unix_stream_socket { read write };
  allowcom -ipc netd w; #allow clatd netd:fifo_file { read write };
  allowcom -ipc netd w; #allow clatd netd:unix_dgram_socket { read write };
  allowcom -ipc netd w; #allow clatd netd:unix_stream_socket { read write };
  allowcom -sig clatd c; #allow clatd clatd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig clatd k; #allow clatd clatd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig clatd n; #allow clatd clatd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig clatd o; #allow clatd clatd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig clatd s; #allow clatd clatd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig netd c; #allow clatd netd:process sigchld;
  allowdev -root /dev;
  allownet -protocol raw use;
  allowpriv cap_ipc_lock;
  allowpriv cap_net_admin;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv setsecurity;
  inline "allow clatd clatd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow clatd clatd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow clatd clatd:lnk_file { read lock ioctl open getattr };" #path_list: 
}

