{
domain_name isolated_app : appdomain;
domain_trans runas;
domain_trans zygote;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc isolated_app r; #allow isolated_app isolated_app:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc isolated_app r; #allow isolated_app isolated_app:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc isolated_app r; #allow isolated_app isolated_app:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc isolated_app w; #allow isolated_app isolated_app:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc isolated_app w; #allow isolated_app isolated_app:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc isolated_app w; #allow isolated_app isolated_app:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig isolated_app c; #allow isolated_app isolated_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig isolated_app k; #allow isolated_app isolated_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig isolated_app n; #allow isolated_app isolated_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig isolated_app o; #allow isolated_app isolated_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig isolated_app s; #allow isolated_app isolated_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowpriv execmem;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv ptrace;
  allowpriv setsecurity;
  allowsvc activity f ;
  allowsvc display f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow isolated_app app_data_file:file { read write getattr lock };" #path_list: 
  inline "allow isolated_app isolated_app:dir { read search ioctl open getattr };" #path_list: 
  inline "allow isolated_app isolated_app:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow isolated_app isolated_app:lnk_file { read lock ioctl open getattr };" #path_list: 
}

