{
domain_name recovery;
  allow / r,w,x,s;
  allow /cache/** r,w,s,x;
  allow /charger r,w,x,s;
  allow /default\.prop r,w,x,s;
  allow /dev/** r,w,s;
  allow /dev/adf-interface[0-9]*\.[0-9]* r,w,s,x;
  allow /dev/adf-overlay-engine[0-9]*\.[0-9]* r,w,s,x;
  allow /dev/adf[0-9]* r,w,s,x;
  allow /dev/android_adb.* r,w,x,s;
  allow /dev/ashmem r,x,s;
  allow /dev/block/** r,w,s;
  allow /dev/fuse r,w,x,s;
  allow /dev/graphics/** r,w,s,x;
  allow /dev/input(/.*) r,w,s,x;
  allow /dev/socket/property_service r,w,s;
  allow /dev/tty[0-9]* r,w,x,s;
  allow /dev/usb-ffs/adb r,w,x,s;
  allow /file_contexts r,w,x,s;
  allow /fstab\..* r,w,x,s;
  allow /init\..* r,w,x,s;
  allow /lost\+found r,w,x,s;
  allow /odm/** r,w,s,x;
  allow /oem/** r,w,s,x;
  allow /proc r,w,x,s;
  allow /proc/sys/vm/drop_caches r,w,x,s;
  allow /property_contexts r,w,x,s;
  allow /res/** r,w,x,s;
  allow /sbin/** r,w,x,s;
  allow /seapp_contexts r,w,x,s;
  allow /sepolicy r,w,x,s;
  allow /sys/** r,w,x,s;
  allow /sys/power/wake_lock r,w,x,s;
  allow /sys/power/wake_unlock r,w,x,s;
  allow /system/** r,w,s,x;
  allow /system/bin/logwrapper r,w,s,x;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf r,w,s,x;
  allow /ueventd\..* r,w,x,s;
  allow /vendor/** r,w,s,x;
  allowbinder su c ;
  allowcom -ipc init w; #allow recovery init:unix_stream_socket connectto;
  allowcom -ipc recovery r; #allow recovery recovery:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc recovery r; #allow recovery recovery:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc recovery r; #allow recovery recovery:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc recovery w; #allow recovery recovery:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc recovery w; #allow recovery recovery:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc recovery w; #allow recovery recovery:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow recovery init:process sigchld;
  allowcom -sig recovery c; #allow recovery recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched setfscreate signull setrlimit };
  allowcom -sig recovery k; #allow recovery recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched setfscreate signull setrlimit };
  allowcom -sig recovery n; #allow recovery recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched setfscreate signull setrlimit };
  allowcom -sig recovery o; #allow recovery recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched setfscreate signull setrlimit };
  allowcom -sig recovery s; #allow recovery recovery:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched setfscreate signull setrlimit };
  allowdev -root /dev;
  allowfs fuse  r,s,x,w;
  allowfs fuse  s,r,w;
  allowfs proc_drop_caches  w,r,s,x;
  allowfs sysfs  w,r,s,x;
  allowfs tmpfs  w,r,s,x;
  allowfs tmpfs  w,r,s;
  allowpriv cap2_block_suspend;
  allowpriv cap2_mac_admin;
  allowpriv cap_chown;
  allowpriv cap_dac_override;
  allowpriv cap_fowner;
  allowpriv cap_fsetid;
  allowpriv cap_setfcap;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv cap_sys_admin;
  allowpriv cap_sys_tty_config;
  allowpriv execmem;
  allowpriv fs_label;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv klog_read;
  allowpriv mount;
  allowpriv part_relabel;
  allowpriv quotaon;
  allowpriv relabel;
  allowpriv setsecurity;
  allowprop ctl. ;
  allowprop sys.powerctl ;
  inline "allow recovery dev_type:blk_file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow recovery exec_type:dir { rename search setattr read create reparent getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };" #path_list: 
  inline "allow recovery exec_type:file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };" #path_list: 
  inline "allow recovery exec_type:lnk_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };" #path_list: 
  inline "allow recovery fuse:dir { read search ioctl open getattr };"
  inline "allow recovery fuse:file { read lock ioctl open getattr };"
  inline "allow recovery recovery:dir { read search ioctl open getattr };" #path_list: 
  inline "allow recovery recovery:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow recovery recovery:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow recovery rootfs:file { execute read execute_no_trans getattr entrypoint open };"
  inline "allow recovery tmpfs:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };"
  inline "allow recovery tmpfs:file { rename execute setattr read lock create getattr execute_no_trans write ioctl unlink open append };"
  inline "allow recovery unlabeled:dir { rename search setattr read create reparent getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };" #path_list: 
  inline "allow recovery unlabeled:file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };" #path_list: 
  inline "allow recovery unlabeled:lnk_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };" #path_list: 
}

