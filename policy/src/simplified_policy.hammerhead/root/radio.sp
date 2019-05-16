{
domain_name radio : appdomain,netdomain,binderservicedomain,mlstrustedsubject,bluetoothdomain;
domain_trans runas;
domain_trans zygote;
  
  allow /data/misc/net/** r,w,x,s;
  allow /data/misc/sms/** r,w,s,x;
  allow /dev/alarm r,w,x,s;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /dev/socket/property_service r,w,s;
  allow /dev/socket/qmux_audio/** r,w,s;
  allow /dev/socket/qmux_bluetooth/** r,w,s;
  allow /dev/socket/qmux_gps/** r,w,s;
  allow /dev/socket/qmux_radio/** r,w,s;
  allow /dev/socket/rild r,w,s;
  allow /odm/** m;
  allow /system/** m;
  allow /system/bin/logwrapper m;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf m;
  allow /vendor/** m;
  allowbinder keystore c ;
  allowbinder su c ;
  allowcom -ipc app_data_file r; #allow radio app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc app_data_file w; #allow radio app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc init w; #allow radio init:unix_stream_socket connectto;
  allowcom -ipc qmux w; #allow radio qmux:unix_stream_socket connectto;
  allowcom -ipc radio r; #allow radio radio:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc radio r; #allow radio radio:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc radio r; #allow radio radio:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc radio w; #allow radio radio:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc radio w; #allow radio radio:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc radio w; #allow radio radio:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc radio_data_file r; #allow radio radio_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc radio_data_file w; #allow radio radio_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc radio_qmuxd_socket r; #allow radio radio_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc radio_qmuxd_socket w; #allow radio radio_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc rild w; #allow radio rild:unix_stream_socket connectto;
  allowcom -sig radio c; #allow radio radio:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig radio k; #allow radio radio:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig radio n; #allow radio radio:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig radio o; #allow radio radio:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig radio s; #allow radio radio:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowdev -root /dev;
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
  allowprop ctl.ril-daemon ;
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
  allowsvc -name app_api_service f ;
  allowsvc -name system_api_service f ;
  allowsvc SurfaceFlinger f ;
  allowsvc android.security.keystore f ;
  allowsvc carrier_config a,f ;
  allowsvc common_time.clock f ;
  allowsvc common_time.config f ;
  allowsvc display.qservice f ;
  allowsvc drm.drmManager f ;
  allowsvc ims a,f ;
  allowsvc iphonesubinfo a,f ;
  allowsvc iphonesubinfo2 a,f ;
  allowsvc iphonesubinfo_msim a,f ;
  allowsvc isms a,f ;
  allowsvc isms2 a,f ;
  allowsvc isms_msim a,f ;
  allowsvc isub a,f ;
  allowsvc media.audio_flinger f ;
  allowsvc media.audio_policy f ;
  allowsvc media.camera f ;
  allowsvc media.log f ;
  allowsvc media.player f ;
  allowsvc media.radio f ;
  allowsvc media.resource_manager f ;
  allowsvc media.sound_trigger_hw f ;
  allowsvc phone a,f ;
  allowsvc phone1 a,f ;
  allowsvc phone2 a,f ;
  allowsvc phone_msim a,f ;
  allowsvc radio.phone a,f ;
  allowsvc radio.phonesubinfo a,f ;
  allowsvc radio.sms a,f ;
  allowsvc simphonebook a,f ;
  allowsvc simphonebook2 a,f ;
  allowsvc simphonebook_msim a,f ;
  allowsvc sip a,f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow radio app_data_file:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow radio app_data_file:file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow radio app_data_file:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow radio app_data_file:sock_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow radio radio:dir { read search ioctl open getattr };" #path_list: 
  inline "allow radio radio:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow radio radio:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow radio radio_qmuxd_socket:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };"
  inline "allow radio radio_qmuxd_socket:file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow radio radio_qmuxd_socket:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow radio radio_qmuxd_socket:sock_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow radio rild_qmuxd_socket:sock_file { read lock getattr write ioctl open append };"
  inline "qmux_socket(radio)"
  inline "type_transition radio qmuxd_socket:dir radio_qmuxd_socket;"
  inline "type_transition radio qmuxd_socket:fifo_file radio_qmuxd_socket;"
  inline "type_transition radio qmuxd_socket:file radio_qmuxd_socket;"
  inline "type_transition radio qmuxd_socket:lnk_file radio_qmuxd_socket;"
  inline "type_transition radio qmuxd_socket:sock_file radio_qmuxd_socket;"
}

