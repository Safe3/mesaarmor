{
domain_name irsc_util;
domain_trans init /system/bin/irsc_util;
  allow /system/bin/irsc_util r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc irsc_util r; #allow irsc_util irsc_util:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc irsc_util r; #allow irsc_util irsc_util:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc irsc_util r; #allow irsc_util irsc_util:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc irsc_util w; #allow irsc_util irsc_util:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc irsc_util w; #allow irsc_util irsc_util:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc irsc_util w; #allow irsc_util irsc_util:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow irsc_util init:process sigchld;
  allowcom -sig irsc_util c; #allow irsc_util irsc_util:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig irsc_util k; #allow irsc_util irsc_util:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig irsc_util n; #allow irsc_util irsc_util:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig irsc_util o; #allow irsc_util irsc_util:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig irsc_util s; #allow irsc_util irsc_util:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allownet -protocol socket create;
  allownet -protocol socket rw;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow irsc_util irsc_util:dir { read search ioctl open getattr };" #path_list: 
  inline "allow irsc_util irsc_util:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow irsc_util irsc_util:lnk_file { read lock ioctl open getattr };" #path_list: 
}

