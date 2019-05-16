{
domain_name watchdogd;
  allow /dev/kmsg r,w,x,s;
  allow /dev/watchdog r,w,x,s;
  allow /init r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc watchdogd r; #allow watchdogd watchdogd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc watchdogd r; #allow watchdogd watchdogd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc watchdogd r; #allow watchdogd watchdogd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc watchdogd w; #allow watchdogd watchdogd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc watchdogd w; #allow watchdogd watchdogd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc watchdogd w; #allow watchdogd watchdogd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow watchdogd init:process sigchld;
  allowcom -sig watchdogd c; #allow watchdogd watchdogd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig watchdogd k; #allow watchdogd watchdogd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig watchdogd n; #allow watchdogd watchdogd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig watchdogd o; #allow watchdogd watchdogd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig watchdogd s; #allow watchdogd watchdogd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  inline "allow watchdogd watchdogd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow watchdogd watchdogd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow watchdogd watchdogd:lnk_file { read lock ioctl open getattr };" #path_list: 
}

