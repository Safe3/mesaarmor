{
domain_name nfc : appdomain,binderservicedomain,netdomain;
domain_trans runas;
domain_trans zygote;
  
  allow /data/local/tmp/** r,s;
  allow /data/nfc/** r,w,s,x;
  allow /dev/bcm2079x r,w,x,s;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/pn544 r,w,x,s;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /dev/socket/property_service r,w,s;
  allow /mnt/expand/[^/]+/local/tmp/** r,s;
  allow /sys/** r,w,s;
  allow /sys/devices/platform/nfc-power/nfc_power r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder keystore c ;
  allowbinder su c ;
  allowcom -ipc app_data_file r; #allow nfc app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc app_data_file w; #allow nfc app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc init w; #allow nfc init:unix_stream_socket connectto;
  allowcom -ipc nfc r; #allow nfc nfc:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc nfc r; #allow nfc nfc:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc nfc r; #allow nfc nfc:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc nfc w; #allow nfc nfc:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc nfc w; #allow nfc nfc:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc nfc w; #allow nfc nfc:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc nfc_data_file r; #allow nfc nfc_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc nfc_data_file w; #allow nfc nfc_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -sig nfc c; #allow nfc nfc:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig nfc k; #allow nfc nfc:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig nfc n; #allow nfc nfc:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig nfc o; #allow nfc nfc:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig nfc s; #allow nfc nfc:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowdev -root /dev;
  allowfs sysfs  w,r,s;
  allowks keystore i,g,s ;
  allownet -protocol raw use;
  allowpriv execmem;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv ptrace;
  allowpriv relabel;
  allowpriv setsecurity;
  allowprop nfc. ;
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
  allowsvc nfc a,f ;
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
  inline "allow nfc app_data_file:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow nfc app_data_file:file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow nfc app_data_file:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow nfc app_data_file:sock_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow nfc nfc:dir { read search ioctl open getattr };" #path_list: 
  inline "allow nfc nfc:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow nfc nfc:lnk_file { read lock ioctl open getattr };" #path_list: 
}

