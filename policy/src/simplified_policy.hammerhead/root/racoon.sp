{
domain_name racoon : netdomain,mlstrustedsubject;
domain_trans init /system/bin/racoon;
  
  allow /data/misc/vpn/** r,w,s,x;
  allow /dev/tun r,w,x,s;
  allow /odm/** r,w,x,s;
  allow /system/** r,w,x,s;
  allow /system/bin/logwrapper r,w,x,s;
  allow /system/bin/racoon r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf r,w,x,s;
  allow /vendor/** r,w,x,s;
  allowbinder keystore c ;
  allowbinder servicemanager c ;
  allowbinder su c ;
  allowcom -ipc racoon r; #allow racoon racoon:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc racoon r; #allow racoon racoon:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc racoon r; #allow racoon racoon:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc racoon w; #allow racoon racoon:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc racoon w; #allow racoon racoon:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc racoon w; #allow racoon racoon:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow racoon init:process sigchld;
  allowcom -sig racoon c; #allow racoon racoon:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig racoon k; #allow racoon racoon:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig racoon n; #allow racoon racoon:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig racoon o; #allow racoon racoon:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig racoon s; #allow racoon racoon:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowfs cgroup  w,r,s;
  allowks keystore s,g ;
  allownet -protocol raw use;
  allowpriv cap_net_admin;
  allowpriv cap_setuid;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowsvc android.security.keystore f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow racoon cgroup:dir { create add_name };" #path_list: 
  inline "allow racoon racoon:dir { read search ioctl open getattr };" #path_list: 
  inline "allow racoon racoon:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow racoon racoon:lnk_file { read lock ioctl open getattr };" #path_list: 
}

