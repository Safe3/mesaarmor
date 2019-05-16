{
domain_name uncrypt : mlstrustedsubject;
domain_trans init /system/bin/uncrypt;
  allow /cache/** r,w,s,x;
  allow /data/local/tmp/** r,w,s,x;
  allow /dev/block/** r,w,s,x;
  allow /dev/block/platform/msm_sdcc\.1/by-name/userdata r,w,x,s;
  allow /dev/socket/property_service r,w,s;
  allow /mnt/expand/[^/]+/local/tmp/** r,w,s,x;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/bin/uncrypt r,w,x,s;
  allowbinder su c ;
  allowcom -ipc cache_file w; #allow uncrypt cache_file:fifo_file { write open append };
  allowcom -ipc init w; #allow uncrypt init:unix_stream_socket connectto;
  allowcom -ipc uncrypt r; #allow uncrypt uncrypt:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc uncrypt r; #allow uncrypt uncrypt:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc uncrypt r; #allow uncrypt uncrypt:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc uncrypt w; #allow uncrypt uncrypt:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc uncrypt w; #allow uncrypt uncrypt:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc uncrypt w; #allow uncrypt uncrypt:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow uncrypt init:process sigchld;
  allowcom -sig uncrypt c; #allow uncrypt uncrypt:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig uncrypt k; #allow uncrypt uncrypt:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig uncrypt n; #allow uncrypt uncrypt:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig uncrypt o; #allow uncrypt uncrypt:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig uncrypt s; #allow uncrypt uncrypt:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowpriv cap_dac_override;
  allowpriv cap_sys_rawio;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv relabel;
  allowpriv setsecurity;
  allowprop sys.powerctl ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow uncrypt app_data_file:dir { read search ioctl open getattr };" #path_list: 
  inline "allow uncrypt app_data_file:file { read lock ioctl open getattr };" #path_list: 
  inline "allow uncrypt app_data_file:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow uncrypt uncrypt:dir { read search ioctl open getattr };" #path_list: 
  inline "allow uncrypt uncrypt:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow uncrypt uncrypt:lnk_file { read lock ioctl open getattr };" #path_list: 
}

