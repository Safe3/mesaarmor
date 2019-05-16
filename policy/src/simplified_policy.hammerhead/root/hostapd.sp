{
domain_name hostapd : netdomain;
domain_trans netd /system/bin/hostapd;
  
  allow /data/misc/wifi/** r,w,s,x;
  allow /data/misc/wifi/hostapd/** r,w,s;
  allow /data/misc/wifi/sockets/** r,w,s;
  allow /dev/socket/wpa_eth[0-9] r,w,s;
  allow /dev/socket/wpa_wlan[0-9] r,w,s;
  allow /persist/** r,w,s;
  allow /persist/wifi/** r,w,s,x;
  allow /system/bin/hostapd r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc hostapd r; #allow hostapd hostapd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc hostapd r; #allow hostapd hostapd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc hostapd r; #allow hostapd hostapd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc hostapd w; #allow hostapd hostapd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc hostapd w; #allow hostapd hostapd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc hostapd w; #allow hostapd hostapd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc netd r; #allow hostapd netd:fifo_file { read write };
  allowcom -ipc netd r; #allow hostapd netd:unix_dgram_socket { read write };
  allowcom -ipc netd r; #allow hostapd netd:unix_stream_socket { read write };
  allowcom -ipc netd w; #allow hostapd netd:fifo_file { read write };
  allowcom -ipc netd w; #allow hostapd netd:unix_dgram_socket { read write };
  allowcom -ipc netd w; #allow hostapd netd:unix_stream_socket { read write };
  allowcom -sig hostapd c; #allow hostapd hostapd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig hostapd k; #allow hostapd hostapd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig hostapd n; #allow hostapd hostapd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig hostapd o; #allow hostapd hostapd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig hostapd s; #allow hostapd hostapd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig netd c; #allow hostapd netd:process sigchld;
  allownet -protocol raw use;
  allowpriv cap_net_admin;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  inline "allow hostapd hostapd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow hostapd hostapd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow hostapd hostapd:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "type_transition hostapd wifi_data_file:dir wpa_socket "hostapd";"
  inline "type_transition hostapd wifi_data_file:dir wpa_socket "sockets";"
}

