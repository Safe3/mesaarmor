{
domain_name install_recovery;
domain_trans init /system/bin/install-recovery.sh;
  allow /cache/** r,w,s,x;
  allow /dev/block/** s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/boot r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/recovery r,w,x,s;
  allow /odm/** r,w,x,s;
  allow /proc/sys/vm/drop_caches r,w,x,s;
  allow /system/** r,w,x,s;
  allow /system/bin/install-recovery.sh r,w,x,s;
  allow /system/bin/logwrapper r,w,x,s;
  allow /system/bin/sh r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf r,w,x,s;
  allow /vendor/** r,w,x,s;
  allowbinder su c ;
  allowcom -ipc install_recovery r; #allow install_recovery install_recovery:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc install_recovery r; #allow install_recovery install_recovery:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc install_recovery r; #allow install_recovery install_recovery:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc install_recovery w; #allow install_recovery install_recovery:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc install_recovery w; #allow install_recovery install_recovery:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc install_recovery w; #allow install_recovery install_recovery:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow install_recovery init:process sigchld;
  allowcom -sig install_recovery c; #allow install_recovery install_recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig install_recovery k; #allow install_recovery install_recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig install_recovery n; #allow install_recovery install_recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig install_recovery o; #allow install_recovery install_recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig install_recovery s; #allow install_recovery install_recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowfs proc_drop_caches  w,r,s,x;
  allowpriv cap_dac_override;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow install_recovery install_recovery:dir { read search ioctl open getattr };" #path_list: 
  inline "allow install_recovery install_recovery:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow install_recovery install_recovery:lnk_file { read lock ioctl open getattr };" #path_list: 
}

