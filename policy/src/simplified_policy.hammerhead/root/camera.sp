{
domain_name camera;
domain_trans init /system/bin/mm-qcamera-daemon;
  allow /data/** r,w,s;
  allow /data/app/** r,w,s;
  allow /data/cam_socket[0-9] r,w,s;
  allow /data/fdAlbum r,w,x,s;
  allow /data/misc/camera/** r,w,x,s;
  allow /dev/accelerometer r,w,x,s;
  allow /dev/akm8973.* r,w,x,s;
  allow /dev/cam r,w,x,s;
  allow /dev/gemini.* r,w,x,s;
  allow /dev/gss r,w,x,s;
  allow /dev/jpeg([0-9])+ r,w,x,s;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/media([0-9])+ r,w,x,s;
  allow /dev/msm_camera/** r,w,x,s;
  allow /dev/msm_dsps r,w,x,s;
  allow /dev/msm_rotator r,w,x,s;
  allow /dev/nvhdcp1 r,w,x,s;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /dev/sensors r,w,x,s;
  allow /dev/smd_sns_dsps r,w,x,s;
  allow /dev/socket/sensor_ctl_socket r,w,s;
  allow /dev/tegra.* r,w,x,s;
  allow /dev/v4l-subdev.* r,w,x,s;
  allow /dev/video([0-9])+ r,w,x,s;
  allow /dev/video[0-9]* r,w,x,s;
  allow /mnt/expand/[^/]+/** r,w,s;
  allow /mnt/expand/[^/]+/app/** r,w,s;
  allow /persist/** s;
  allow /persist/camera_calibration/** r,w,s,x;
  allow /system/bin/mm-qcamera-daemon r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc camera r; #allow camera camera:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc camera r; #allow camera camera:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc camera r; #allow camera camera:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc camera w; #allow camera camera:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc camera w; #allow camera camera:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc camera w; #allow camera camera:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc sensors w; #allow camera sensors:unix_stream_socket connectto;
  allowcom -sig camera c; #allow camera camera:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig camera k; #allow camera camera:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig camera n; #allow camera camera:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig camera o; #allow camera camera:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig camera s; #allow camera camera:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig init c; #allow camera init:process sigchld;
  allowdev -root /dev;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow camera camera:dir { read search ioctl open getattr };" #path_list: 
  inline "allow camera camera:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow camera camera:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "type_transition camera system_data_file:file camera_data_file "fdAlbum";"
  inline "type_transition camera system_data_file:sock_file camera_socket "cam_socket1";"
  inline "type_transition camera system_data_file:sock_file camera_socket "cam_socket2";"
}

