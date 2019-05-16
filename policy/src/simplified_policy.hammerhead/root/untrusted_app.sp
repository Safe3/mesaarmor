{
domain_name untrusted_app : appdomain,netdomain,bluetoothdomain;
domain_trans runas;
domain_trans zygote;
  
  allow /cache/** r,w,s,x;
  allow /data/anr/** r,w,x,s;
  allow /data/app-private/vmdl.*\.tmp/** r,w,s,x;
  allow /data/app/vmdl[^/]+\.tmp/** r,w,s,x;
  allow /data/local/tmp/** r,w,s,x;
  allow /data/media/** r,w,s,x;
  allow /data/misc/perfprofd/** r,w,s,x;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/mtp_usb r,w,x,s;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /dev/tun r,w,x,s;
  allow /mnt/asec/** r,w,x,s;
  allow /mnt/asec/[^/]+/[^/]+\.zip r,m,x,s;
  allow /mnt/asec/[^/]+/lib/** r,m,x,s;
  allow /mnt/expand/[^/]+/app/vmdl[^/]+\.tmp/** r,w,s,x;
  allow /mnt/expand/[^/]+/local/tmp/** r,w,s,x;
  allow /mnt/expand/[^/]+/media/** r,w,s,x;
  allow /mnt/media_rw/** s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder keystore c ;
  allowbinder su c ;
  allowcom -ipc app_data_file r; #allow untrusted_app app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc app_data_file w; #allow untrusted_app app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc untrusted_app r; #allow untrusted_app untrusted_app:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc untrusted_app r; #allow untrusted_app untrusted_app:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc untrusted_app r; #allow untrusted_app untrusted_app:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc untrusted_app w; #allow untrusted_app untrusted_app:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc untrusted_app w; #allow untrusted_app untrusted_app:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc untrusted_app w; #allow untrusted_app untrusted_app:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig untrusted_app c; #allow untrusted_app untrusted_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig untrusted_app k; #allow untrusted_app untrusted_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig untrusted_app n; #allow untrusted_app untrusted_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig untrusted_app o; #allow untrusted_app untrusted_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig untrusted_app s; #allow untrusted_app untrusted_app:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowdev -root /dev;
  allowks keystore i,g,s ;
  allownet -protocol raw use;
  allowpriv execmem;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv ptrace;
  allowpriv relabel;
  allowpriv setsecurity;
  allowsvc -name app_api_service f ;
  allowsvc -name servicemanager l ;
  allowsvc -name system_api_service f ;
  allowsvc SurfaceFlinger f ;
  allowsvc android.security.keystore f ;
  allowsvc batteryproperties f ;
  allowsvc batterypropreg f ;
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
  allowsvc nfc f ;
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
  inline "allow untrusted_app app_data_file:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow untrusted_app app_data_file:file { rename execute setattr read lock create getattr execute_no_trans write ioctl unlink open execmod append };" #path_list: 
  inline "allow untrusted_app app_data_file:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow untrusted_app app_data_file:sock_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow untrusted_app system_app_data_file:file { read write getattr };" #path_list: 
  inline "allow untrusted_app untrusted_app:dir { read search ioctl open getattr };" #path_list: 
  inline "allow untrusted_app untrusted_app:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow untrusted_app untrusted_app:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow untrusted_app untrusted_app_devpts:chr_file { read write ioctl open getattr };"
  inline "type_transition untrusted_app devpts:chr_file untrusted_app_devpts;"
}

