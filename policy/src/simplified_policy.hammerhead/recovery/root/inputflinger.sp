{
domain_name inputflinger : binderservicedomain;
domain_trans init /system/bin/inputflinger;
  allow /dev/input(/.*) r,w,s,x;
  allow /sys/power/wake_lock r,w,x,s;
  allow /sys/power/wake_unlock r,w,x,s;
  allow /system/bin/inputflinger r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder servicemanager c ;
  allowbinder su c ;
  allowbinder system_server c ;
  allowcom -ipc inputflinger r; #allow inputflinger inputflinger:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc inputflinger r; #allow inputflinger inputflinger:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc inputflinger r; #allow inputflinger inputflinger:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc inputflinger w; #allow inputflinger inputflinger:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc inputflinger w; #allow inputflinger inputflinger:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc inputflinger w; #allow inputflinger inputflinger:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow inputflinger init:process sigchld;
  allowcom -sig inputflinger c; #allow inputflinger inputflinger:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig inputflinger k; #allow inputflinger inputflinger:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig inputflinger n; #allow inputflinger inputflinger:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig inputflinger o; #allow inputflinger inputflinger:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig inputflinger s; #allow inputflinger inputflinger:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowpriv cap2_block_suspend;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  allowsvc inputflinger a,f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow inputflinger inputflinger:dir { read search ioctl open getattr };" #path_list: 
  inline "allow inputflinger inputflinger:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow inputflinger inputflinger:lnk_file { read lock ioctl open getattr };" #path_list: 
}

