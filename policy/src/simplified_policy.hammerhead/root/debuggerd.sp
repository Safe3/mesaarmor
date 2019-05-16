{
domain_name debuggerd : mlstrustedsubject;
domain_trans init /system/bin/debuggerd;
domain_trans init /system/bin/debuggerd64;
  allow /data/** r,w,s,x;
  allow /data/misc/shared_relro/** r,w,s,x;
  allow /data/security/** r,w,s,x;
  allow /data/system/ndebugsocket r,w,s;
  allow /data/tombstones/** r,w,s,x;
  allow /dev/input(/.*) r,w,s,x;
  allow /dev/socket/logdr r,w,s;
  allow /mnt/expand/[^/]+/** r,w,s,x;
  allow /system/bin/debuggerd r,w,x,s;
  allow /system/bin/debuggerd64 r,w,x,s;
  allow /system/bin/logcat r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc debuggerd r; #allow debuggerd debuggerd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc debuggerd r; #allow debuggerd debuggerd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc debuggerd r; #allow debuggerd debuggerd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc debuggerd w; #allow debuggerd debuggerd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc debuggerd w; #allow debuggerd debuggerd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc debuggerd w; #allow debuggerd debuggerd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc logd w; #allow debuggerd logd:unix_stream_socket connectto;
  allowcom -ipc system_server w; #allow debuggerd system_server:unix_stream_socket connectto;
  allowcom -sig debuggerd c; #allow debuggerd debuggerd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig debuggerd k; #allow debuggerd debuggerd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig debuggerd n; #allow debuggerd debuggerd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig debuggerd o; #allow debuggerd debuggerd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig debuggerd s; #allow debuggerd debuggerd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig domain o; #allow debuggerd domain:process { sigstop signal };
  allowcom -sig domain s; #allow debuggerd domain:process { sigstop signal };
  allowcom -sig init c; #allow debuggerd init:process sigchld;
  allowdev -root /dev;
  allowfs selinuxfs  r,s,w,x;
  allowpriv cap2_syslog;
  allowpriv cap_chown;
  allowpriv cap_dac_override;
  allowpriv cap_fowner;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv part_relabel;
  allowpriv ptrace;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow debuggerd debuggerd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow debuggerd debuggerd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow debuggerd debuggerd:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow debuggerd domain:dir { read search ioctl open getattr };" #path_list: 
  inline "allow debuggerd domain:file { read lock ioctl open getattr };" #path_list: 
  inline "allow debuggerd domain:lnk_file read;" #path_list: 
  inline "allow debuggerd exec_type:file { read lock ioctl open getattr };" #path_list: 
  inline "allow debuggerd selinuxfs:file { read lock getattr write ioctl open append };" #path_list: 
}

