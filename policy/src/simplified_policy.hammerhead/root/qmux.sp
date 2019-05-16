{
domain_name qmux;
domain_trans init /system/bin/qmuxd;
  allow /dev/hsicctl[0-3] r,w,x,s;
  allow /dev/mdm r,w,x,s;
  allow /dev/modem.* r,w,x,s;
  allow /dev/qmi[0-2] r,w,x,s;
  allow /dev/rmnet_mux_ctrl r,w,x,s;
  allow /dev/smdcntl[0-7] r,w,x,s;
  allow /dev/socket/qmux_audio/** r,w,s;
  allow /dev/socket/qmux_bluetooth/** r,w,s;
  allow /dev/socket/qmux_gps/** r,w,s;
  allow /dev/socket/qmux_radio/** r,w,s;
  allow /dev/ttyUSB0 r,w,x,s;
  allow /sys/devices/virtual/smdpkt/smdcntl([0-9])+/open_timeout r,w,x,s;
  allow /sys/power/wake_lock r,w,x,s;
  allow /sys/power/wake_unlock r,w,x,s;
  allow /system/bin/qmuxd r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc qmux r; #allow qmux qmux:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc qmux r; #allow qmux qmux:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc qmux r; #allow qmux qmux:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc qmux w; #allow qmux qmux:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc qmux w; #allow qmux qmux:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc qmux w; #allow qmux qmux:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow qmux init:process sigchld;
  allowcom -sig qmux c; #allow qmux qmux:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig qmux k; #allow qmux qmux:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig qmux n; #allow qmux qmux:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig qmux o; #allow qmux qmux:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig qmux s; #allow qmux qmux:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowpriv cap2_block_suspend;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow qmux bridge_qmuxd_socket:sock_file { getattr unlink };"
  inline "allow qmux mediaserver_qmuxd_socket:sock_file { getattr unlink };"
  inline "allow qmux netmgrd_qmuxd_socket:sock_file { getattr unlink };"
  inline "allow qmux qmux:dir { read search ioctl open getattr };" #path_list: 
  inline "allow qmux qmux:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow qmux qmux:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow qmux radio_qmuxd_socket:sock_file { getattr unlink };"
  inline "allow qmux rild_qmuxd_socket:sock_file { getattr unlink };"
  inline "allow qmux sensors_qmuxd_socket:sock_file { getattr unlink };"
  inline "allow qmux system_server_qmuxd_socket:sock_file { getattr unlink };"
  inline "allow qmux thermald_qmuxd_socket:sock_file { getattr unlink };"
}

