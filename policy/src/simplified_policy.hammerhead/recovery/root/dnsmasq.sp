{
domain_name dnsmasq : netdomain;
domain_trans netd /system/bin/dnsmasq;
  
  allow /data/misc/dhcp/** r,w,s,x;
  allow /system/bin/dnsmasq r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc dnsmasq r; #allow dnsmasq dnsmasq:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc dnsmasq r; #allow dnsmasq dnsmasq:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc dnsmasq r; #allow dnsmasq dnsmasq:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc dnsmasq w; #allow dnsmasq dnsmasq:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc dnsmasq w; #allow dnsmasq dnsmasq:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc dnsmasq w; #allow dnsmasq dnsmasq:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc netd r; #allow dnsmasq netd:fifo_file { read write };
  allowcom -ipc netd r; #allow dnsmasq netd:unix_dgram_socket { read write };
  allowcom -ipc netd r; #allow dnsmasq netd:unix_stream_socket { read write };
  allowcom -ipc netd w; #allow dnsmasq netd:fifo_file { read write };
  allowcom -ipc netd w; #allow dnsmasq netd:unix_dgram_socket { read write };
  allowcom -ipc netd w; #allow dnsmasq netd:unix_stream_socket { read write };
  allowcom -sig dnsmasq c; #allow dnsmasq dnsmasq:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig dnsmasq k; #allow dnsmasq dnsmasq:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig dnsmasq n; #allow dnsmasq dnsmasq:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig dnsmasq o; #allow dnsmasq dnsmasq:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig dnsmasq s; #allow dnsmasq dnsmasq:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig netd c; #allow dnsmasq netd:process sigchld;
  allownet -protocol raw use;
  allowpriv cap_dac_override;
  allowpriv cap_net_admin;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  inline "allow dnsmasq dnsmasq:dir { read search ioctl open getattr };" #path_list: 
  inline "allow dnsmasq dnsmasq:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow dnsmasq dnsmasq:lnk_file { read lock ioctl open getattr };" #path_list: 
}

