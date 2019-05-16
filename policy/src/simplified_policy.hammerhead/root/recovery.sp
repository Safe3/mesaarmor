{
domain_name recovery;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc recovery r; #allow recovery recovery:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc recovery r; #allow recovery recovery:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc recovery r; #allow recovery recovery:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc recovery w; #allow recovery recovery:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc recovery w; #allow recovery recovery:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc recovery w; #allow recovery recovery:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig recovery c; #allow recovery recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig recovery k; #allow recovery recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig recovery n; #allow recovery recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig recovery o; #allow recovery recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig recovery s; #allow recovery recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  inline "allow recovery recovery:dir { read search ioctl open getattr };" #path_list: 
  inline "allow recovery recovery:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow recovery recovery:lnk_file { read lock ioctl open getattr };" #path_list: 
}

