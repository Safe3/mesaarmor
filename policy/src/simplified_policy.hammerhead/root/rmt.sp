{
domain_name rmt;
domain_trans init /system/bin/rmt_storage;
  allow /dev/block/** r,w,s;
  allow /dev/block/mmcblk0 r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/fsc r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/fsg r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/modemst1 r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/modemst2 r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/ssd r,w,x,s;
  allow /dev/smem_log r,w,x,s;
  allow /dev/uio[0-9]* r,w,x,s;
  allow /sys/power/wake_lock r,w,x,s;
  allow /sys/power/wake_unlock r,w,x,s;
  allow /system/bin/rmt_storage r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc rmt r; #allow rmt rmt:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc rmt r; #allow rmt rmt:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc rmt r; #allow rmt rmt:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc rmt w; #allow rmt rmt:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc rmt w; #allow rmt rmt:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc rmt w; #allow rmt rmt:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow rmt init:process sigchld;
  allowcom -sig rmt c; #allow rmt rmt:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig rmt k; #allow rmt rmt:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig rmt n; #allow rmt rmt:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig rmt o; #allow rmt rmt:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig rmt s; #allow rmt rmt:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowfs cgroup  w,r,s;
  allownet -protocol socket create;
  allownet -protocol socket rw;
  allowpriv cap2_block_suspend;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv cap_sys_admin;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow rmt cgroup:dir { create add_name };" #path_list: 
  inline "allow rmt rmt:dir { read search ioctl open getattr };" #path_list: 
  inline "allow rmt rmt:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow rmt rmt:lnk_file { read lock ioctl open getattr };" #path_list: 
}

