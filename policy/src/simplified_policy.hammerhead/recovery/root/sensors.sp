{
domain_name sensors;
domain_trans init /system/bin/sensors\.qcom;
  allow /data/misc/sensors/** r,w,s,x;
  allow /data/system/sensors/** r,w,s,x;
  allow /dev/accelerometer r,w,x,s;
  allow /dev/akm8973.* r,w,x,s;
  allow /dev/cpu_dma_latency r,w,x,s;
  allow /dev/gss r,w,x,s;
  allow /dev/msm_dsps r,w,x,s;
  allow /dev/sensors r,w,x,s;
  allow /dev/smd_sns_dsps r,w,x,s;
  allow /dev/smem_log r,w,x,s;
  allow /dev/socket/** r,w,s;
  allow /dev/socket/qmux_audio/** r,w,s;
  allow /dev/socket/qmux_bluetooth/** r,w,s;
  allow /dev/socket/qmux_gps/** r,w,s;
  allow /dev/socket/qmux_radio/** r,w,s;
  allow /dev/socket/sensor_ctl_socket r,w,s;
  allow /persist/** r,w,s;
  allow /persist/sensors/** r,w,s,x;
  allow /sys/power/wake_lock r,w,x,s;
  allow /sys/power/wake_unlock r,w,x,s;
  allow /system/bin/sensors\.qcom r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc qmux w; #allow sensors qmux:unix_stream_socket connectto;
  allowcom -ipc sensors r; #allow sensors sensors:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc sensors r; #allow sensors sensors:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc sensors r; #allow sensors sensors:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc sensors w; #allow sensors sensors:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc sensors w; #allow sensors sensors:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc sensors w; #allow sensors sensors:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc sensors_qmuxd_socket r; #allow sensors sensors_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc sensors_qmuxd_socket w; #allow sensors sensors_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -sig init c; #allow sensors init:process sigchld;
  allowcom -sig sensors c; #allow sensors sensors:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig sensors k; #allow sensors sensors:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig sensors n; #allow sensors sensors:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig sensors o; #allow sensors sensors:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig sensors s; #allow sensors sensors:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowfs cgroup  w,r,s;
  allownet -protocol socket create;
  allownet -protocol socket rw;
  allowpriv cap2_block_suspend;
  allowpriv cap_chown;
  allowpriv cap_dac_override;
  allowpriv cap_dac_read_search;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow sensors cgroup:dir { create add_name };" #path_list: 
  inline "allow sensors sensors:dir { read search ioctl open getattr };" #path_list: 
  inline "allow sensors sensors:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow sensors sensors:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow sensors sensors_qmuxd_socket:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };"
  inline "allow sensors sensors_qmuxd_socket:file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow sensors sensors_qmuxd_socket:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow sensors sensors_qmuxd_socket:sock_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "qmux_socket(sensors)"
  inline "type_transition sensors qmuxd_socket:dir sensors_qmuxd_socket;"
  inline "type_transition sensors qmuxd_socket:fifo_file sensors_qmuxd_socket;"
  inline "type_transition sensors qmuxd_socket:file sensors_qmuxd_socket;"
  inline "type_transition sensors qmuxd_socket:lnk_file sensors_qmuxd_socket;"
  inline "type_transition sensors qmuxd_socket:sock_file sensors_qmuxd_socket;"
  inline "type_transition sensors socket_device:sock_file sensors_socket "sensor_ctl_socket";"
}

