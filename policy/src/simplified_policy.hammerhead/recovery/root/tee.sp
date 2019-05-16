{
domain_name tee;
domain_trans init /system/bin/tf_daemon;
domain_trans init /system/bin/qseecomd;
  allow /data/** r,w,s;
  allow /data/drm/** r,w,s,x;
  allow /data/misc/playready/** r,w,s,x;
  allow /dev/block/** s;
  allow /dev/block/mmcblk0rpmb r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/ssd r,w,x,s;
  allow /dev/qseecom r,w,x,s;
  allow /dev/tf_driver r,w,x,s;
  allow /mnt/expand/[^/]+/** r,w,s;
  allow /persist/** r,w,s;
  allow /persist/data/** r,w,s,x;
  allow /persist/playready/** r,w,s,x;
  allow /persist/widevine/** r,w,s,x;
  allow /system/bin/qseecomd r,w,x,s;
  allow /system/bin/tf_daemon r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc tee r; #allow tee tee:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc tee r; #allow tee tee:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc tee r; #allow tee tee:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc tee w; #allow tee tee:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc tee w; #allow tee tee:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc tee w; #allow tee tee:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow tee init:process sigchld;
  allowcom -sig tee c; #allow tee tee:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowcom -sig tee k; #allow tee tee:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowcom -sig tee n; #allow tee tee:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowcom -sig tee o; #allow tee tee:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowcom -sig tee s; #allow tee tee:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowpriv cap_dac_override;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv cap_sys_rawio;
  allowpriv execmem;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow tee tee:dir { read search ioctl open getattr };" #path_list: 
  inline "allow tee tee:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow tee tee:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow tee tee_data_file:dir { search read getattr write ioctl remove_name open add_name };"
  inline "allow tee tee_data_file:file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "type_transition tee system_data_file:dir drm_data_file;"
}

