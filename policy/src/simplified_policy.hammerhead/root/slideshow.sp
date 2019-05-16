{
domain_name slideshow;
  allow / r,w,x,s;
  allow /charger r,w,x,s;
  allow /default\.prop r,w,x,s;
  allow /dev/** r,w,s;
  allow /dev/adf-interface[0-9]*\.[0-9]* r,w,s,x;
  allow /dev/adf-overlay-engine[0-9]*\.[0-9]* r,w,s,x;
  allow /dev/adf[0-9]* r,w,s,x;
  allow /dev/graphics/** r,w,s,x;
  allow /dev/input(/.*) r,w,s,x;
  allow /dev/kmsg r,w,x,s;
  allow /dev/tty[0-9]* r,w,x,s;
  allow /file_contexts r,w,x,s;
  allow /fstab\..* r,w,x,s;
  allow /init\..* r,w,x,s;
  allow /lost\+found r,w,x,s;
  allow /proc r,w,x,s;
  allow /property_contexts r,w,x,s;
  allow /res/** r,w,x,s;
  allow /sbin/** r,w,x,s;
  allow /seapp_contexts r,w,x,s;
  allow /sepolicy r,w,x,s;
  allow /sys/power/wake_lock r,w,x,s;
  allow /sys/power/wake_unlock r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /ueventd\..* r,w,x,s;
  allowbinder su c ;
  allowcom -ipc slideshow r; #allow slideshow slideshow:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc slideshow r; #allow slideshow slideshow:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc slideshow r; #allow slideshow slideshow:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc slideshow w; #allow slideshow slideshow:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc slideshow w; #allow slideshow slideshow:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc slideshow w; #allow slideshow slideshow:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow slideshow init:process sigchld;
  allowcom -sig slideshow c; #allow slideshow slideshow:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig slideshow k; #allow slideshow slideshow:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig slideshow n; #allow slideshow slideshow:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig slideshow o; #allow slideshow slideshow:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig slideshow s; #allow slideshow slideshow:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowpriv cap2_block_suspend;
  allowpriv cap_sys_tty_config;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  inline "allow slideshow rootfs:file { read open getattr entrypoint execute };"
  inline "allow slideshow slideshow:dir { read search ioctl open getattr };" #path_list: 
  inline "allow slideshow slideshow:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow slideshow slideshow:lnk_file { read lock ioctl open getattr };" #path_list: 
}

