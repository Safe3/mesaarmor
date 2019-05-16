{
domain_name platform_app : appdomain,netdomain,bluetoothdomain;
domain_trans runas;
domain_trans zygote;
  
  allow /cache/** r,w,s,x;
  allow /data/app-private/** s;
  allow /data/app-private/vmdl.*\.tmp/** r,w,s,x;
  allow /data/app/vmdl[^/]+\.tmp/** r,w,s,x;
  allow /data/diag_logs/** r,w,s,x;
  allow /data/local/tmp/** r,w,x,s;
  allow /data/media/** r,w,s,x;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /mnt/asec/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/vmdl[^/]+\.tmp/** r,w,s,x;
  allow /mnt/expand/[^/]+/local/tmp/** r,w,x,s;
  allow /mnt/expand/[^/]+/media/** r,w,s,x;
  allow /mnt/media_rw/** r,w,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder keystore c ;
  allowbinder su c ;
  allowcom -ipc app_data_file r; #allow platform_app app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc app_data_file w; #allow platform_app app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc platform_app r; #allow platform_app platform_app:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc platform_app r; #allow platform_app platform_app:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc platform_app r; #allow platform_app platform_app:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc platform_app w; #allow platform_app platform_app:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc platform_app w; #allow platform_app platform_app:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc platform_app w; #allow platform_app platform_app:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc time w; #allow platform_app time:unix_stream_socket connectto;
  allowcom -sig platform_app c; #allow platform_app platform_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig platform_app k; #allow platform_app platform_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig platform_app n; #allow platform_app platform_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig platform_app o; #allow platform_app platform_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig platform_app s; #allow platform_app platform_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowdev -root /dev;
  allowfs vfat  w,r,s,x;
  allowfs vfat  w,r,s;
  allowks keystore i,g,s ;
  allownet -protocol raw use;
  allownet -protocol socket create;
  allownet -protocol socket rw;
  allowpriv execmem;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv ptrace;
  allowpriv relabel;
  allowpriv setsecurity;
  allowsvc -name app_api_service f ;
  allowsvc -name system_api_service f ;
  allowsvc SurfaceFlinger f ;
  allowsvc android.security.keystore f ;
  allowsvc carrier_config f ;
  allowsvc common_time.clock f ;
  allowsvc common_time.config f ;
  allowsvc display.qservice f ;
  allowsvc drm.drmManager f ;
  allowsvc ims f ;
  allowsvc iphonesubinfo f ;
  allowsvc iphonesubinfo2 f ;
  allowsvc iphonesubinfo_msim f ;
  allowsvc isms f ;
  allowsvc isms2 f ;
  allowsvc isms_msim f ;
  allowsvc isub f ;
  allowsvc media.audio_flinger f ;
  allowsvc media.audio_policy f ;
  allowsvc media.camera f ;
  allowsvc media.log f ;
  allowsvc media.player f ;
  allowsvc media.radio f ;
  allowsvc media.resource_manager f ;
  allowsvc media.sound_trigger_hw f ;
  allowsvc persistent_data_block f ;
  allowsvc phone f ;
  allowsvc phone1 f ;
  allowsvc phone2 f ;
  allowsvc phone_msim f ;
  allowsvc radio.phone f ;
  allowsvc radio.phonesubinfo f ;
  allowsvc radio.sms f ;
  allowsvc simphonebook f ;
  allowsvc simphonebook2 f ;
  allowsvc simphonebook_msim f ;
  allowsvc sip f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow platform_app app_data_file:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow platform_app app_data_file:file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow platform_app app_data_file:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow platform_app app_data_file:sock_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow platform_app platform_app:dir { read search ioctl open getattr };" #path_list: 
  inline "allow platform_app platform_app:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow platform_app platform_app:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow platform_app vfat:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };"
  inline "allow platform_app vfat:file { rename setattr read lock create getattr write ioctl unlink open append };"
}

