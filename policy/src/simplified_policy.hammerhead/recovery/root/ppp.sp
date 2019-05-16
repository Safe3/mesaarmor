{
domain_name ppp : netdomain;
domain_trans mtp /system/bin/pppd;
  
  allow /data/misc/vpn/** r,w,s,x;
  allow /dev/ppp r,w,x,s;
  allow /odm/** r,w,x,s;
  allow /system/** r,w,x,s;
  allow /system/bin/logwrapper r,w,x,s;
  allow /system/bin/pppd r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf r,w,x,s;
  allow /vendor/** r,w,x,s;
  allowbinder su c ;
  allowcom -ipc mtp r; #allow ppp mtp:unix_dgram_socket { setopt setattr read lock getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc mtp w; #allow ppp mtp:unix_dgram_socket { setopt setattr read lock getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc ppp r; #allow ppp ppp:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc ppp r; #allow ppp ppp:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc ppp r; #allow ppp ppp:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc ppp w; #allow ppp ppp:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc ppp w; #allow ppp ppp:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc ppp w; #allow ppp ppp:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig mtp c; #allow ppp mtp:process sigchld;
  allowcom -sig ppp c; #allow ppp ppp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig ppp k; #allow ppp ppp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig ppp n; #allow ppp ppp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig ppp o; #allow ppp ppp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig ppp s; #allow ppp ppp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allownet -protocol raw use;
  allownet -protocol socket -domain mtp create;
  allownet -protocol socket -domain mtp rw;
  allowpriv cap_net_admin;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  inline "allow ppp ppp:dir { read search ioctl open getattr };" #path_list: 
  inline "allow ppp ppp:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow ppp ppp:lnk_file { read lock ioctl open getattr };" #path_list: 
}

