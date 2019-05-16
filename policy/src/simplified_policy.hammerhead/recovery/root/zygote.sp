{
domain_name zygote : mlstrustedsubject;
domain_trans init /system/bin/app_process64;
domain_trans init /system/bin/app_process32;
  allow /data/** r,w,s,x;
  allow /data/app/[^/]+/oat/** r,w,s,x;
  allow /data/app/vmdl[^/]+\.tmp/oat/** r,w,s,x;
  allow /data/dalvik-cache/** r,w,s,x;
  allow /data/resource-cache/** r,w,s,x;
  allow /data/security/** r,w,s,x;
  allow /mnt/expand/[^/]+/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/[^/]+/oat/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/vmdl[^/]+\.tmp/oat/** r,w,s,x;
  allow /mnt/runtime/** s;
  allow /mnt/user/** r,w,s;
  allow /odm/** r,x,s;
  allow /storage/** s;
  allow /system/** r,x,s;
  allow /system/bin/app_process32 r,w,x,s;
  allow /system/bin/app_process64 r,w,x,s;
  allow /system/bin/dex2oat r,w,x,s;
  allow /system/bin/logwrapper r,x,s;
  allow /system/bin/patchoat r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf r,x,s;
  allow /vendor/** r,x,s;
  allowbinder su c ;
  allowcom -ipc zygote r; #allow zygote zygote:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc zygote r; #allow zygote zygote:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc zygote r; #allow zygote zygote:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc zygote w; #allow zygote zygote:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc zygote w; #allow zygote zygote:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc zygote w; #allow zygote zygote:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow zygote init:process sigchld;
  allowcom -sig zygote c; #allow zygote zygote:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig zygote k; #allow zygote zygote:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig zygote n; #allow zygote zygote:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig zygote o; #allow zygote zygote:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig zygote s; #allow zygote zygote:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowfs cgroup  w,r,s;
  allowfs selinuxfs  r,s,w,x;
  allowfs tmpfs  s,w,r;
  allowpriv cap_chown;
  allowpriv cap_dac_override;
  allowpriv cap_fowner;
  allowpriv cap_setgid;
  allowpriv cap_setpcap;
  allowpriv cap_setuid;
  allowpriv cap_sys_admin;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv mount;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow zygote appdomain:dir { getattr search };" #path_list: 
  inline "allow zygote appdomain:file { read lock ioctl open getattr };" #path_list: 
  inline "allow zygote cgroup:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow zygote sdcard_type:dir { search setattr create mounton write add_name };" #path_list: 
  inline "allow zygote selinuxfs:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow zygote tmpfs:dir { search setattr create mounton write add_name };"
  inline "allow zygote zygote:dir { read search ioctl open getattr };" #path_list: 
  inline "allow zygote zygote:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow zygote zygote:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow zygote zygote_tmpfs:file { read write };"
}

