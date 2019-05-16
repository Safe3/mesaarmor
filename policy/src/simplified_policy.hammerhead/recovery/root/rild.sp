{
domain_name rild : netdomain;
domain_trans init /system/bin/rild;
  
  allow /data/** r,w,s,x;
  allow /data/misc/sms/** r,w,s,x;
  allow /dev/alarm r,w,x,s;
  allow /dev/hsicctl[0-3] r,w,s,x;
  allow /dev/mdm r,w,s,x;
  allow /dev/modem.* r,w,s,x;
  allow /dev/mpu r,w,x,s;
  allow /dev/mpuirq r,w,x,s;
  allow /dev/mtd/** s;
  allow /dev/qmi[0-2] r,w,s,x;
  allow /dev/rmnet_mux_ctrl r,w,s,x;
  allow /dev/smdcntl[0-7] r,w,s,x;
  allow /dev/socket/property_service r,w,s;
  allow /dev/socket/qmux_audio/** r,w,s;
  allow /dev/socket/qmux_bluetooth/** r,w,s;
  allow /dev/socket/qmux_gps/** r,w,s;
  allow /dev/socket/qmux_radio/** r,w,s;
  allow /dev/ttyUSB0 r,w,s,x;
  allow /dev/tty[0-9]* r,w,x,s;
  allow /efs/** r,w,s,x;
  allow /mnt/expand/[^/]+/** r,w,s,x;
  allow /odm/** r,x,s;
  allow /sys/power/wake_lock r,w,x,s;
  allow /sys/power/wake_unlock r,w,x,s;
  allow /system/** r,x,s;
  allow /system/bin/logwrapper r,x,s;
  allow /system/bin/rild r,w,x,s;
  allow /system/bin/sh r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf r,x,s;
  allow /vendor/** r,x,s;
  allowbinder su c ;
  allowcom -ipc init w; #allow rild init:unix_stream_socket connectto;
  allowcom -ipc qmux w; #allow rild qmux:unix_stream_socket connectto;
  allowcom -ipc rild r; #allow rild rild:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc rild r; #allow rild rild:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc rild r; #allow rild rild:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc rild w; #allow rild rild:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc rild w; #allow rild rild:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc rild w; #allow rild rild:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc rild_qmuxd_socket r; #allow rild rild_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc rild_qmuxd_socket w; #allow rild rild_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -sig init c; #allow rild init:process sigchld;
  allowcom -sig rild c; #allow rild rild:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig rild k; #allow rild rild:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig rild n; #allow rild rild:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig rild o; #allow rild rild:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig rild s; #allow rild rild:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowfs cgroup  w,r,s;
  allownet -protocol raw use;
  allownet -protocol socket create;
  allownet -protocol socket rw;
  allowpriv cap2_block_suspend;
  allowpriv cap_net_admin;
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
  allowprop sys.usb.config ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow rild bluetooth_efs_file:dir { read search ioctl open getattr };" #path_list: 
  inline "allow rild bluetooth_efs_file:file { read lock ioctl open getattr };" #path_list: 
  inline "allow rild cgroup:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow rild rild:dir { read search ioctl open getattr };" #path_list: 
  inline "allow rild rild:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow rild rild:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow rild rild_qmuxd_socket:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };"
  inline "allow rild rild_qmuxd_socket:file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow rild rild_qmuxd_socket:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow rild rild_qmuxd_socket:sock_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow rild sdcard_type:dir { read search ioctl open getattr };" #path_list: 
  inline "qmux_socket(rild)"
  inline "type_transition rild qmuxd_socket:dir rild_qmuxd_socket;"
  inline "type_transition rild qmuxd_socket:fifo_file rild_qmuxd_socket;"
  inline "type_transition rild qmuxd_socket:file rild_qmuxd_socket;"
  inline "type_transition rild qmuxd_socket:lnk_file rild_qmuxd_socket;"
  inline "type_transition rild qmuxd_socket:sock_file rild_qmuxd_socket;"
}

