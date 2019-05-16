{
domain_name tzdatacheck;
domain_trans init /system/bin/tzdatacheck;
  allow /data/misc/zoneinfo/** r,w,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/bin/tzdatacheck r,w,x,s;
  allowbinder su c ;
  allowcom -ipc tzdatacheck r; #allow tzdatacheck tzdatacheck:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc tzdatacheck r; #allow tzdatacheck tzdatacheck:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc tzdatacheck r; #allow tzdatacheck tzdatacheck:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc tzdatacheck w; #allow tzdatacheck tzdatacheck:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc tzdatacheck w; #allow tzdatacheck tzdatacheck:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc tzdatacheck w; #allow tzdatacheck tzdatacheck:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow tzdatacheck init:process sigchld;
  allowcom -sig tzdatacheck c; #allow tzdatacheck tzdatacheck:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig tzdatacheck k; #allow tzdatacheck tzdatacheck:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig tzdatacheck n; #allow tzdatacheck tzdatacheck:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig tzdatacheck o; #allow tzdatacheck tzdatacheck:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig tzdatacheck s; #allow tzdatacheck tzdatacheck:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow tzdatacheck tzdatacheck:dir { read search ioctl open getattr };" #path_list: 
  inline "allow tzdatacheck tzdatacheck:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow tzdatacheck tzdatacheck:lnk_file { read lock ioctl open getattr };" #path_list: 
}

