{
domain_name sdcardd;
domain_trans vold /system/bin/sdcard;
  allow /data/** r,w,x,s;
  allow /data/.layout_version r,w,x,s;
  allow /data/media/** r,w,s,x;
  allow /dev/fuse r,w,x,s;
  allow /mnt/expand/** s;
  allow /mnt/expand/[^/]+/** r,w,x,s;
  allow /mnt/expand/[^/]+/media/** r,w,s,x;
  allow /mnt/media_rw/** r,w,s;
  allow /mnt/runtime/** s;
  allow /storage/** s;
  allow /system/bin/sdcard r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc sdcardd r; #allow sdcardd sdcardd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc sdcardd r; #allow sdcardd sdcardd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc sdcardd r; #allow sdcardd sdcardd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc sdcardd w; #allow sdcardd sdcardd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc sdcardd w; #allow sdcardd sdcardd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc sdcardd w; #allow sdcardd sdcardd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc vold r; #allow sdcardd vold:fifo_file { read write getattr };
  allowcom -ipc vold w; #allow sdcardd vold:fifo_file { read write getattr };
  allowcom -sig sdcardd c; #allow sdcardd sdcardd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig sdcardd k; #allow sdcardd sdcardd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig sdcardd n; #allow sdcardd sdcardd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig sdcardd o; #allow sdcardd sdcardd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig sdcardd s; #allow sdcardd sdcardd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig vold c; #allow sdcardd vold:process sigchld;
  allowdev -root /dev;
  allowfs cgroup  w,r,s;
  allowpriv cap_dac_override;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv cap_sys_admin;
  allowpriv cap_sys_resource;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv mount;
  allowpriv relabel;
  allowpriv setsecurity;
  inline "allow sdcardd cgroup:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow sdcardd sdcard_type:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow sdcardd sdcard_type:file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow sdcardd sdcardd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow sdcardd sdcardd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow sdcardd sdcardd:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow sdcardd storage_stub_file:dir { search mounton };"
  inline "type_transition sdcardd system_data_file:dir media_rw_data_file;"
  inline "type_transition sdcardd system_data_file:file media_rw_data_file;"
}

