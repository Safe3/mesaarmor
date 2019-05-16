{
domain_name vss;
domain_trans init /system/vendor/bin/vss_init;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/vendor/bin/vss_init r,w,x,s;
  allowbinder su c ;
  allowcom -ipc vss r; #allow vss vss:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc vss r; #allow vss vss:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc vss r; #allow vss vss:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc vss w; #allow vss vss:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc vss w; #allow vss vss:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc vss w; #allow vss vss:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow vss init:process sigchld;
  allowcom -sig vss c; #allow vss vss:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig vss k; #allow vss vss:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig vss n; #allow vss vss:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig vss o; #allow vss vss:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig vss s; #allow vss vss:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow vss vss:dir { read search ioctl open getattr };" #path_list: 
  inline "allow vss vss:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow vss vss:lnk_file { read lock ioctl open getattr };" #path_list: 
}

