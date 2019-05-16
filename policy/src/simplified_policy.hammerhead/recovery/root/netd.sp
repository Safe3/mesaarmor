{
domain_name netd : netdomain,mlstrustedsubject;
domain_trans init /system/bin/netd;
  
  allow /data/misc/net/** r,w,s,x;
  allow /data/misc/wifi/** r,w,s,x;
  allow /dev/pts r,w,x,s;
  allow /dev/socket/property_service r,w,s;
  allow /odm/** r,x,s;
  allow /proc/net r,w,s;
  allow /proc/sys/net r,w,s;
  allow /sys/** r,w,s;
  allow /system/** r,x,s;
  allow /system/bin/clatd r,w,x,s;
  allow /system/bin/dhcpcd r,w,x,s;
  allow /system/bin/dnsmasq r,w,x,s;
  allow /system/bin/hostapd r,w,x,s;
  allow /system/bin/logwrapper r,x,s;
  allow /system/bin/netd r,w,x,s;
  allow /system/bin/sh r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf r,x,s;
  allow /vendor/** r,x,s;
  allowbinder su c ;
  allowcom -ipc init w; #allow netd init:unix_stream_socket connectto;
  allowcom -ipc netd r; #allow netd netd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc netd r; #allow netd netd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc netd r; #allow netd netd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc netd w; #allow netd netd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc netd w; #allow netd netd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc netd w; #allow netd netd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig clatd o; #allow netd clatd:process { siginh signal transition rlimitinh };
  allowcom -sig dhcp o; #allow netd dhcp:process { siginh signal transition rlimitinh };
  allowcom -sig dnsmasq o; #allow netd dnsmasq:process { siginh signal transition rlimitinh };
  allowcom -sig hostapd o; #allow netd hostapd:process { siginh signal transition rlimitinh };
  allowcom -sig init c; #allow netd init:process sigchld;
  allowcom -sig netd c; #allow netd netd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig netd k; #allow netd netd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig netd n; #allow netd netd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig netd o; #allow netd netd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig netd s; #allow netd netd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -pts devpts r;
allowdev -pts devpts w;

  allowdev -root /dev;
  allowfs proc_net  w,r,s;
  allowfs sysfs  w,r,s;
  allownet -protocol raw use;
  allowpriv cap_chown;
  allowpriv cap_dac_override;
  allowpriv cap_fowner;
  allowpriv cap_net_admin;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowprop ctl.mdnsd ;
  allowprop dev. ;
  allowprop dhcp. ;
  allowprop hw. ;
  allowprop net. ;
  allowprop persist.security. ;
  allowprop persist.service. ;
  allowprop persist.sys. ;
  allowprop runtime. ;
  allowprop service. ;
  allowprop sys. ;
  allowprop wlan. ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow netd clatd:process transition;"
  inline "allow netd dhcp:process transition;"
  inline "allow netd dnsmasq:process transition;"
  inline "allow netd hostapd:process transition;"
  inline "allow netd netd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow netd netd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow netd netd:lnk_file { read lock ioctl open getattr };" #path_list: 
}

