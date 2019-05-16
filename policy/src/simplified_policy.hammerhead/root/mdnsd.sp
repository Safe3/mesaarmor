{
domain_name mdnsd : netdomain,mlstrustedsubject;
domain_trans init /system/bin/mdnsd;
  
  allow /system/bin/mdnsd r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc mdnsd r; #allow mdnsd mdnsd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc mdnsd r; #allow mdnsd mdnsd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc mdnsd r; #allow mdnsd mdnsd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc mdnsd w; #allow mdnsd mdnsd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc mdnsd w; #allow mdnsd mdnsd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc mdnsd w; #allow mdnsd mdnsd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow mdnsd init:process sigchld;
  allowcom -sig mdnsd c; #allow mdnsd mdnsd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig mdnsd k; #allow mdnsd mdnsd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig mdnsd n; #allow mdnsd mdnsd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig mdnsd o; #allow mdnsd mdnsd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig mdnsd s; #allow mdnsd mdnsd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allownet -protocol raw use;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow mdnsd mdnsd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow mdnsd mdnsd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow mdnsd mdnsd:lnk_file { read lock ioctl open getattr };" #path_list: 
}

