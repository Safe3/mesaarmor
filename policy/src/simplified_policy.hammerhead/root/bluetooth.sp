{
domain_name bluetooth : appdomain,netdomain;
domain_trans runas;
domain_trans zygote;
  
  allow /data/local/tmp/** r,s;
  allow /data/misc/bluedroid/** r,w,s,x;
  allow /data/misc/bluedroid/\.a2dp_ctrl r,w,s;
  allow /data/misc/bluedroid/\.a2dp_data r,w,s;
  allow /data/misc/bluetooth/** r,w,s,x;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /dev/socket/property_service r,w,s;
  allow /dev/socket/sap_uim_socket[0-9] r,w,s;
  allow /dev/ttyHS99 r,w,x,s;
  allow /dev/tun r,w,x,s;
  allow /dev/uhid r,w,x,s;
  allow /dev/uinput r,w,x,s;
  allow /efs/** s;
  allow /mnt/expand/[^/]+/local/tmp/** r,s;
  allow /sys/devices/platform/bluetooth_rfkill/rfkill/rfkill0/state r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder keystore c ;
  allowbinder su c ;
  allowcom -ipc app_data_file r; #allow bluetooth app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc app_data_file w; #allow bluetooth app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc bluetooth r; #allow bluetooth bluetooth:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc bluetooth r; #allow bluetooth bluetooth:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc bluetooth r; #allow bluetooth bluetooth:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc bluetooth w; #allow bluetooth bluetooth:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc bluetooth w; #allow bluetooth bluetooth:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc bluetooth w; #allow bluetooth bluetooth:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc bluetooth_data_file r; #allow bluetooth bluetooth_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc bluetooth_data_file w; #allow bluetooth bluetooth_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc init w; #allow bluetooth init:unix_stream_socket connectto;
  allowcom -ipc rild w; #allow bluetooth rild:unix_stream_socket connectto;
  allowcom -sig bluetooth c; #allow bluetooth bluetooth:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig bluetooth k; #allow bluetooth bluetooth:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig bluetooth n; #allow bluetooth bluetooth:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig bluetooth o; #allow bluetooth bluetooth:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig bluetooth s; #allow bluetooth bluetooth:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowdev -root /dev;
  allowks keystore i,g,s ;
  allownet -protocol raw use;
  allowpriv cap2_wake_alarm;
  allowpriv cap_net_admin;
  allowpriv execmem;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv ptrace;
  allowpriv relabel;
  allowpriv setsecurity;
  allowprop bluetooth. ;
  allowprop ctl.dhcpcd_bt-pan ;
  allowprop dhcp.bt-pan.result ;
  allowprop persist.service.bdroid. ;
  allowsvc -name app_api_service f ;
  allowsvc -name system_api_service f ;
  allowsvc SurfaceFlinger f ;
  allowsvc android.security.keystore f ;
  allowsvc bluetooth f ;
  allowsvc carrier_config f ;
  allowsvc common_time.clock f ;
  allowsvc common_time.config f ;
  allowsvc display.qservice f ;
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
  inline "allow bluetooth app_data_file:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow bluetooth app_data_file:file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow bluetooth app_data_file:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow bluetooth app_data_file:sock_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow bluetooth bluetooth:dir { read search ioctl open getattr };" #path_list: 
  inline "allow bluetooth bluetooth:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow bluetooth bluetooth:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow bluetooth bluetooth_efs_file:dir { read search ioctl open getattr };" #path_list: 
  inline "allow bluetooth bluetooth_efs_file:file { read lock ioctl open getattr };" #path_list: 
  inline "allow bluetooth bluetooth_efs_file:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow bluetooth proc_bluetooth_writable:file { read lock getattr write ioctl open append };"
  inline "type_transition bluetooth bluetooth_data_file:sock_file bluetooth_socket;"
}

