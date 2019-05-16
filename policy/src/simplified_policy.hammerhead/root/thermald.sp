{
domain_name thermald;
domain_trans init /system/bin/thermal-engine-hh;
  allow /dev/msm_thermal_query r,w,x,s;
  allow /dev/smem_log r,w,x,s;
  allow /dev/socket/** r,w,s;
  allow /dev/socket/mpdecision/** r,w,s;
  allow /dev/socket/qmux_audio/** r,w,s;
  allow /dev/socket/qmux_bluetooth/** r,w,s;
  allow /dev/socket/qmux_gps/** r,w,s;
  allow /dev/socket/qmux_radio/** r,w,s;
  allow /sys/** r,w,s;
  allow /sys/devices/system/cpu/** r,w,x,s;
  allow /system/bin/thermal-engine-hh r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc mpdecision w; #allow thermald mpdecision:unix_stream_socket connectto;
  allowcom -ipc qmux w; #allow thermald qmux:unix_stream_socket connectto;
  allowcom -ipc thermald r; #allow thermald thermald:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc thermald r; #allow thermald thermald:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc thermald r; #allow thermald thermald:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc thermald w; #allow thermald thermald:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc thermald w; #allow thermald thermald:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc thermald w; #allow thermald thermald:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc thermald_qmuxd_socket r; #allow thermald thermald_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc thermald_qmuxd_socket w; #allow thermald thermald_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -sig init c; #allow thermald init:process sigchld;
  allowcom -sig thermald c; #allow thermald thermald:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig thermald k; #allow thermald thermald:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig thermald n; #allow thermald thermald:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig thermald o; #allow thermald thermald:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig thermald s; #allow thermald thermald:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowfs sysfs  w,r,s;
  allownet -protocol socket create;
  allownet -protocol socket rw;
  allowpriv cap_dac_override;
  allowpriv cap_net_admin;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow thermald thermald:dir { read search ioctl open getattr };" #path_list: 
  inline "allow thermald thermald:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow thermald thermald:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow thermald thermald_qmuxd_socket:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };"
  inline "allow thermald thermald_qmuxd_socket:file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow thermald thermald_qmuxd_socket:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow thermald thermald_qmuxd_socket:sock_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow thermald thermald_socket:sock_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "qmux_socket(thermald)"
  inline "type_transition thermald qmuxd_socket:dir thermald_qmuxd_socket;"
  inline "type_transition thermald qmuxd_socket:fifo_file thermald_qmuxd_socket;"
  inline "type_transition thermald qmuxd_socket:file thermald_qmuxd_socket;"
  inline "type_transition thermald qmuxd_socket:lnk_file thermald_qmuxd_socket;"
  inline "type_transition thermald qmuxd_socket:sock_file thermald_qmuxd_socket;"
  inline "type_transition thermald socket_device:sock_file thermald_socket;"
}

