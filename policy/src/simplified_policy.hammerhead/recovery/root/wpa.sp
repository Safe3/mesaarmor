{
domain_name wpa : netdomain;
domain_trans init /system/bin/wpa_supplicant;
  
  allow /data/misc/wifi/** r,w,s,x;
  allow /data/misc/wifi/hostapd/** r,w,s;
  allow /data/misc/wifi/sockets/** r,w,s;
  allow /data/misc/wifi/sockets/wpa_ctrl.* r,w,s;
  allow /dev/socket/wpa_eth[0-9] r,w,s;
  allow /dev/socket/wpa_wlan[0-9] r,w,s;
  allow /persist/** r,w,s;
  allow /persist/wifi/** r,w,s,x;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/bin/wpa_supplicant r,w,x,s;
  allowbinder keystore c ;
  allowbinder servicemanager c ;
  allowbinder su c ;
  allowcom -ipc su w; #allow wpa su:unix_dgram_socket sendto;
  allowcom -ipc system_server w; #allow wpa system_server:unix_dgram_socket sendto;
  allowcom -ipc wpa r; #allow wpa wpa:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc wpa r; #allow wpa wpa:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc wpa r; #allow wpa wpa:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc wpa w; #allow wpa wpa:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc wpa w; #allow wpa wpa:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc wpa w; #allow wpa wpa:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow wpa init:process sigchld;
  allowcom -sig wpa c; #allow wpa wpa:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig wpa k; #allow wpa wpa:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig wpa n; #allow wpa wpa:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig wpa o; #allow wpa wpa:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig wpa s; #allow wpa wpa:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowfs cgroup  w,r,s;
  allowks keystore s,g ;
  allownet -protocol raw use;
  allowpriv cap_net_admin;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowsvc android.security.keystore f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow wpa cgroup:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow wpa wpa:dir { read search ioctl open getattr };" #path_list: 
  inline "allow wpa wpa:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow wpa wpa:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "type_transition wpa wifi_data_file:dir wpa_socket "sockets";"
}

