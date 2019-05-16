{
domain_name dhcp : netdomain;
domain_trans init /system/bin/dhcpcd;
domain_trans netd /system/bin/dhcpcd;
  
  allow /data/misc/dhcp/** r,w,s,x;
  allow /dev/socket/property_service r,w,s;
  allow /odm/** r,w,x,s;
  allow /proc/net r,w,s;
  allow /proc/sys/net r,w,s;
  allow /system/** r,w,x,s;
  allow /system/bin/dhcpcd r,w,x,s;
  allow /system/bin/logwrapper r,w,x,s;
  allow /system/bin/sh r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf r,w,x,s;
  allow /vendor/** r,w,x,s;
  allowbinder su c ;
  allowcom -ipc dhcp r; #allow dhcp dhcp:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc dhcp r; #allow dhcp dhcp:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc dhcp r; #allow dhcp dhcp:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc dhcp w; #allow dhcp dhcp:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc dhcp w; #allow dhcp dhcp:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc dhcp w; #allow dhcp dhcp:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc init w; #allow dhcp init:unix_stream_socket connectto;
  allowcom -ipc netd r; #allow dhcp netd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc netd r; #allow dhcp netd:unix_dgram_socket { read write };
  allowcom -ipc netd r; #allow dhcp netd:unix_stream_socket { read write };
  allowcom -ipc netd w; #allow dhcp netd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc netd w; #allow dhcp netd:unix_dgram_socket { read write };
  allowcom -ipc netd w; #allow dhcp netd:unix_stream_socket { read write };
  allowcom -sig dhcp c; #allow dhcp dhcp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig dhcp k; #allow dhcp dhcp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig dhcp n; #allow dhcp dhcp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig dhcp o; #allow dhcp dhcp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig dhcp s; #allow dhcp dhcp:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig init c; #allow dhcp init:process sigchld;
  allowcom -sig netd c; #allow dhcp netd:process sigchld;
  allowfs cgroup  w,r,s;
  allowfs proc_net  w,r,s;
  allownet -protocol raw use;
  allowpriv cap_net_admin;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowprop dhcp. ;
  allowprop dhcp.bt-pan.result ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow dhcp cgroup:dir { write create add_name };" #path_list: 
  inline "allow dhcp dhcp:dir { read search ioctl open getattr };" #path_list: 
  inline "allow dhcp dhcp:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow dhcp dhcp:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "type_transition dhcp system_data_file:dir dhcp_data_file;"
  inline "type_transition dhcp system_data_file:file dhcp_data_file;"
}

