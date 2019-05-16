{
domain_name bridge;
domain_trans init /system/bin/bridgemgrd;
  allow /dev/socket/qmux_audio/** r,w,s;
  allow /dev/socket/qmux_bluetooth/** r,w,s;
  allow /dev/socket/qmux_gps/** r,w,s;
  allow /dev/socket/qmux_radio/** r,w,s;
  allow /sys/class/android_usb/f_rmnet_smd_sdio/transport r,w,x,s;
  allow /sys/devices/virtual/android_usb/android0/f_rmnet_smd_sdio/transport r,w,x,s;
  allow /system/bin/bridgemgrd r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc bridge r; #allow bridge bridge:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc bridge r; #allow bridge bridge:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc bridge r; #allow bridge bridge:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc bridge w; #allow bridge bridge:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc bridge w; #allow bridge bridge:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc bridge w; #allow bridge bridge:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc bridge_qmuxd_socket r; #allow bridge bridge_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc bridge_qmuxd_socket w; #allow bridge bridge_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc qmux w; #allow bridge qmux:unix_stream_socket connectto;
  allowcom -sig bridge c; #allow bridge bridge:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig bridge k; #allow bridge bridge:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig bridge n; #allow bridge bridge:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig bridge o; #allow bridge bridge:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig bridge s; #allow bridge bridge:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig init c; #allow bridge init:process sigchld;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow bridge bridge:dir { read search ioctl open getattr };" #path_list: 
  inline "allow bridge bridge:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow bridge bridge:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow bridge bridge_qmuxd_socket:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };"
  inline "allow bridge bridge_qmuxd_socket:file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow bridge bridge_qmuxd_socket:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow bridge bridge_qmuxd_socket:sock_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "qmux_socket(bridge)"
  inline "type_transition bridge qmuxd_socket:dir bridge_qmuxd_socket;"
  inline "type_transition bridge qmuxd_socket:fifo_file bridge_qmuxd_socket;"
  inline "type_transition bridge qmuxd_socket:file bridge_qmuxd_socket;"
  inline "type_transition bridge qmuxd_socket:lnk_file bridge_qmuxd_socket;"
  inline "type_transition bridge qmuxd_socket:sock_file bridge_qmuxd_socket;"
}

