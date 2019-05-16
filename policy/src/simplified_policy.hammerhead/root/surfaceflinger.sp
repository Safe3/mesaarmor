{
domain_name surfaceflinger : binderservicedomain,mlstrustedsubject;
domain_trans init /system/bin/surfaceflinger;
  allow /dev/adf-interface[0-9]*\.[0-9]* r,w,x,s;
  allow /dev/adf-overlay-engine[0-9]*\.[0-9]* r,w,x,s;
  allow /dev/adf[0-9]* r,w,x,s;
  allow /dev/graphics/** r,w,x,s;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/msm_rotator r,w,s,x;
  allow /dev/nvhdcp1 r,w,s,x;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /dev/qseecom r,w,x,s;
  allow /dev/socket/property_service r,w,s;
  allow /dev/tegra.* r,w,s,x;
  allow /dev/tf_driver r,w,x,s;
  allow /dev/video[0-9]* r,w,s,x;
  allow /sys/devices/virtual/graphics/fb1/hpd r,w,x,s;
  allow /sys/devices/virtual/graphics/fb1/product_description r,w,x,s;
  allow /sys/devices/virtual/graphics/fb1/vendor_name r,w,x,s;
  allow /system/bin/surfaceflinger r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder adbd c ;
  allowbinder bluetooth c ;
  allowbinder bootanim c ;
  allowbinder drmserver c ;
  allowbinder dumpstate c ;
  allowbinder gatekeeperd c ;
  allowbinder healthd c ;
  allowbinder inputflinger c ;
  allowbinder isolated_app c ;
  allowbinder keystore c ;
  allowbinder mediaserver c ;
  allowbinder nfc c ;
  allowbinder platform_app c ;
  allowbinder radio c ;
  allowbinder servicemanager c ;
  allowbinder shared_relro c ;
  allowbinder shell c ;
  allowbinder su c ;
  allowbinder surfaceflinger c ;
  allowbinder system_app c ;
  allowbinder system_server c ;
  allowbinder untrusted_app c ;
  allowcom -ipc init w; #allow surfaceflinger init:unix_stream_socket connectto;
  allowcom -ipc surfaceflinger r; #allow surfaceflinger surfaceflinger:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc surfaceflinger r; #allow surfaceflinger surfaceflinger:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc surfaceflinger r; #allow surfaceflinger surfaceflinger:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc surfaceflinger w; #allow surfaceflinger surfaceflinger:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc surfaceflinger w; #allow surfaceflinger surfaceflinger:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc surfaceflinger w; #allow surfaceflinger surfaceflinger:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc tee w; #allow surfaceflinger tee:unix_stream_socket connectto;
  allowcom -sig init c; #allow surfaceflinger init:process sigchld;
  allowcom -sig surfaceflinger c; #allow surfaceflinger surfaceflinger:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig surfaceflinger k; #allow surfaceflinger surfaceflinger:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig surfaceflinger n; #allow surfaceflinger surfaceflinger:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig surfaceflinger o; #allow surfaceflinger surfaceflinger:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig surfaceflinger s; #allow surfaceflinger surfaceflinger:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv setsecurity;
  allowprop ctl.bootanim ;
  allowprop dev. ;
  allowprop hw. ;
  allowprop net. ;
  allowprop persist.security. ;
  allowprop persist.service. ;
  allowprop persist.sys. ;
  allowprop runtime. ;
  allowprop service. ;
  allowprop sys. ;
  allowprop wlan. ;
  allowsvc SurfaceFlinger a,f ;
  allowsvc common_time.clock f ;
  allowsvc common_time.config f ;
  allowsvc display.qservice a,f ;
  allowsvc media.audio_flinger f ;
  allowsvc media.audio_policy f ;
  allowsvc media.camera f ;
  allowsvc media.log f ;
  allowsvc media.player f ;
  allowsvc media.radio f ;
  allowsvc media.resource_manager f ;
  allowsvc media.sound_trigger_hw f ;
  allowsvc permission f ;
  allowsvc power f ;
  allowsvc window f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow surfaceflinger app_data_file:file { read write };" #path_list: 
  inline "allow surfaceflinger appdomain:dir { read search ioctl open getattr };" #path_list: 
  inline "allow surfaceflinger appdomain:file { read lock ioctl open getattr };" #path_list: 
  inline "allow surfaceflinger appdomain:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow surfaceflinger binderservicedomain:dir { read search ioctl open getattr };" #path_list: 
  inline "allow surfaceflinger binderservicedomain:file { read lock ioctl open getattr };" #path_list: 
  inline "allow surfaceflinger binderservicedomain:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow surfaceflinger dumpstate:dir { read search ioctl open getattr };" #path_list: 
  inline "allow surfaceflinger dumpstate:file { read lock ioctl open getattr };" #path_list: 
  inline "allow surfaceflinger dumpstate:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow surfaceflinger surfaceflinger:dir { read search ioctl open getattr };" #path_list: 
  inline "allow surfaceflinger surfaceflinger:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow surfaceflinger surfaceflinger:lnk_file { read lock ioctl open getattr };" #path_list: 
}

