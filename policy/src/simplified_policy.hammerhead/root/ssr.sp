{
domain_name ssr;
domain_trans init /system/bin/subsystem_ramdump;
  allow /data/tombstones/** s;
  allow /data/tombstones/ramdump/** r,w,s,x;
  allow /dev/ramdump_.* r,w,x,s;
  allow /system/bin/subsystem_ramdump r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc ssr r; #allow ssr ssr:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc ssr r; #allow ssr ssr:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc ssr r; #allow ssr ssr:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc ssr w; #allow ssr ssr:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc ssr w; #allow ssr ssr:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc ssr w; #allow ssr ssr:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow ssr init:process sigchld;
  allowcom -sig ssr c; #allow ssr ssr:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig ssr k; #allow ssr ssr:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig ssr n; #allow ssr ssr:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig ssr o; #allow ssr ssr:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig ssr s; #allow ssr ssr:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow ssr ssr:dir { read search ioctl open getattr };" #path_list: 
  inline "allow ssr ssr:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow ssr ssr:lnk_file { read lock ioctl open getattr };" #path_list: 
}

