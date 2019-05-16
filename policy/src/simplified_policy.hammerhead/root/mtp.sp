{
domain_name mtp : netdomain;
domain_trans init /system/bin/mtpd;
  
  allow /data/misc/vpn/** s;
  allow /system/bin/mtpd r,w,x,s;
  allow /system/bin/pppd r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc mtp r; #allow mtp mtp:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc mtp r; #allow mtp mtp:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc mtp r; #allow mtp mtp:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc mtp w; #allow mtp mtp:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc mtp w; #allow mtp mtp:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc mtp w; #allow mtp mtp:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow mtp init:process sigchld;
  allowcom -sig mtp c; #allow mtp mtp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig mtp k; #allow mtp mtp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig mtp n; #allow mtp mtp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig mtp o; #allow mtp mtp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig mtp s; #allow mtp mtp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig ppp o; #allow mtp ppp:process { siginh signal transition rlimitinh };
  allownet -protocol raw use;
  allownet -protocol socket create;
  allownet -protocol socket rw;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow mtp mtp:dir { read search ioctl open getattr };" #path_list: 
  inline "allow mtp mtp:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow mtp mtp:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow mtp ppp:process transition;"
}

