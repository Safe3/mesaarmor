{
domain_name lmkd : mlstrustedsubject;
domain_trans init /system/bin/lmkd;
  allow /sys/module/lowmemorykiller/** r,w,x,s;
  allow /system/bin/lmkd r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc lmkd r; #allow lmkd lmkd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc lmkd r; #allow lmkd lmkd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc lmkd r; #allow lmkd lmkd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc lmkd w; #allow lmkd lmkd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc lmkd w; #allow lmkd lmkd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc lmkd w; #allow lmkd lmkd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig appdomain k; #allow lmkd appdomain:process sigkill;
  allowcom -sig init c; #allow lmkd init:process sigchld;
  allowcom -sig lmkd c; #allow lmkd lmkd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig lmkd k; #allow lmkd lmkd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig lmkd n; #allow lmkd lmkd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig lmkd o; #allow lmkd lmkd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig lmkd s; #allow lmkd lmkd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowfs cgroup  w,r,s;
  allowpriv cap_dac_override;
  allowpriv cap_ipc_lock;
  allowpriv cap_sys_nice;
  allowpriv cap_sys_resource;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow lmkd appdomain:dir { read search ioctl open getattr };" #path_list: 
  inline "allow lmkd appdomain:file { read lock getattr write ioctl open };" #path_list: 
  inline "allow lmkd appdomain:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow lmkd cgroup:dir { remove_name rmdir };" #path_list: 
  inline "allow lmkd lmkd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow lmkd lmkd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow lmkd lmkd:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow lmkd system_server:dir { read search ioctl open getattr };" #path_list: 
  inline "allow lmkd system_server:file { read lock getattr write ioctl open };" #path_list: 
  inline "allow lmkd system_server:lnk_file { read lock ioctl open getattr };" #path_list: 
}

