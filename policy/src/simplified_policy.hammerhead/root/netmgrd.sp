{
domain_name netmgrd : netdomain;
domain_trans init /system/bin/netmgrd;
  
  allow /dev/socket/property_service r,w,s;
  allow /dev/socket/qmux_audio/** r,w,s;
  allow /dev/socket/qmux_bluetooth/** r,w,s;
  allow /dev/socket/qmux_gps/** r,w,s;
  allow /dev/socket/qmux_radio/** r,w,s;
  allow /odm/** r,w,x,s;
  allow /proc/net r,w,s,x;
  allow /proc/sys/net r,w,s,x;
  allow /system/** r,w,x,s;
  allow /system/bin/logwrapper r,w,x,s;
  allow /system/bin/netmgrd r,w,x,s;
  allow /system/bin/sh r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf r,w,x,s;
  allow /vendor/** r,w,x,s;
  allowbinder su c ;
  allowcom -ipc init w; #allow netmgrd init:unix_stream_socket connectto;
  allowcom -ipc netmgrd r; #allow netmgrd netmgrd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc netmgrd r; #allow netmgrd netmgrd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc netmgrd r; #allow netmgrd netmgrd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc netmgrd w; #allow netmgrd netmgrd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc netmgrd w; #allow netmgrd netmgrd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc netmgrd w; #allow netmgrd netmgrd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc netmgrd_qmuxd_socket r; #allow netmgrd netmgrd_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc netmgrd_qmuxd_socket w; #allow netmgrd netmgrd_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc qmux w; #allow netmgrd qmux:unix_stream_socket connectto;
  allowcom -sig init c; #allow netmgrd init:process sigchld;
  allowcom -sig netmgrd c; #allow netmgrd netmgrd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig netmgrd k; #allow netmgrd netmgrd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig netmgrd n; #allow netmgrd netmgrd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig netmgrd o; #allow netmgrd netmgrd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig netmgrd s; #allow netmgrd netmgrd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowfs proc_net  r,s,w,x;
  allowfs proc_net  s,r,w;
  allownet -protocol raw use;
  allowpriv cap_net_admin;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowprop gsm. ;
  allowprop net.cdma ;
  allowprop net.dns ;
  allowprop net.gprs ;
  allowprop net.lte ;
  allowprop net.ppp ;
  allowprop net.qmi ;
  allowprop net.rmnet ;
  allowprop persist.radio ;
  allowprop ril. ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow netmgrd netmgrd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow netmgrd netmgrd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow netmgrd netmgrd:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow netmgrd netmgrd_qmuxd_socket:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };"
  inline "allow netmgrd netmgrd_qmuxd_socket:file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow netmgrd netmgrd_qmuxd_socket:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow netmgrd netmgrd_qmuxd_socket:sock_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "qmux_socket(netmgrd)"
  inline "type_transition netmgrd qmuxd_socket:dir netmgrd_qmuxd_socket;"
  inline "type_transition netmgrd qmuxd_socket:fifo_file netmgrd_qmuxd_socket;"
  inline "type_transition netmgrd qmuxd_socket:file netmgrd_qmuxd_socket;"
  inline "type_transition netmgrd qmuxd_socket:lnk_file netmgrd_qmuxd_socket;"
  inline "type_transition netmgrd qmuxd_socket:sock_file netmgrd_qmuxd_socket;"
}

