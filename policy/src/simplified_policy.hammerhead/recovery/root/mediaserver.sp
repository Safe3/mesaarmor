{
domain_name mediaserver : netdomain,binderservicedomain,mlstrustedsubject;
domain_trans init /system/bin/mediaserver;
  
  allow /data/app/** r,s;
  allow /data/cam_socket[0-9] r,w,s;
  allow /data/fdAlbum r,w,s,x;
  allow /data/media/** r,w,s,x;
  allow /data/mediadrm/** r,w,s,x;
  allow /data/misc/audio/** r,w,s,x;
  allow /data/misc/bluedroid/\.a2dp_ctrl r,w,s;
  allow /data/misc/bluedroid/\.a2dp_data r,w,s;
  allow /data/misc/camera/** r,w,s,x;
  allow /data/misc/media/** r,w,s,x;
  allow /data/misc/sms/** r,s;
  allow /dev/audio.* r,w,s,x;
  allow /dev/cam r,w,x,s;
  allow /dev/eac r,w,s,x;
  allow /dev/gemini.* r,w,x,s;
  allow /dev/jpeg([0-9])+ r,w,x,s;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/media([0-9])+ r,w,x,s;
  allow /dev/msm_aac.* r,w,s,x;
  allow /dev/msm_acdb r,w,s,x;
  allow /dev/msm_amrnb.* r,w,s,x;
  allow /dev/msm_amrwb.* r,w,s,x;
  allow /dev/msm_camera/** r,w,x,s;
  allow /dev/msm_mp3 r,w,s,x;
  allow /dev/msm_rotator r,w,s,x;
  allow /dev/msm_rtac r,w,s,x;
  allow /dev/msm_vidc.* r,w,s,x;
  allow /dev/nvhdcp1 r,w,s,x;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /dev/qseecom r,w,x,s;
  allow /dev/rpmsg-omx[0-9] r,w,x,s;
  allow /dev/rproc_user r,w,x,s;
  allow /dev/snd/** r,w,s,x;
  allow /dev/socket/mpdecision/** r,w,s;
  allow /dev/socket/property_service r,w,s;
  allow /dev/socket/qmux_audio/** r,w,s;
  allow /dev/socket/qmux_bluetooth/** r,w,s;
  allow /dev/socket/qmux_gps/** r,w,s;
  allow /dev/socket/qmux_radio/** r,w,s;
  allow /dev/spdif_out.* r,w,s,x;
  allow /dev/tegra.* r,w,s,x;
  allow /dev/tf_driver r,w,x,s;
  allow /dev/v4l-subdev.* r,w,x,s;
  allow /dev/video([0-9])+ r,w,x,s;
  allow /dev/video[0-9]* r,w,s,x;
  allow /dev/xt_qtaguid r,w,x,s;
  allow /mnt/asec/** r,s;
  allow /mnt/expand/[^/]+/app/** r,s;
  allow /mnt/expand/[^/]+/media/** r,w,s,x;
  allow /odm/** m;
  allow /oem/** r,w,x,s;
  allow /proc/net/xt_qtaguid/ctrl r,w,x,s;
  allow /sys/** r,w,x,s;
  allow /system/** m;
  allow /system/bin/logwrapper m;
  allow /system/bin/mediaserver r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf m;
  allow /vendor/** m;
  allowbinder bluetooth c ;
  allowbinder drmserver c ;
  allowbinder drmserver t ;
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
  allowcom -ipc appdomain r; #allow mediaserver appdomain:fifo_file { read write getattr };
  allowcom -ipc appdomain w; #allow mediaserver appdomain:fifo_file { read write getattr };
  allowcom -ipc bluetooth w; #allow mediaserver bluetooth:unix_stream_socket connectto;
  allowcom -ipc camera w; #allow mediaserver camera:unix_dgram_socket sendto;
  allowcom -ipc drmserver w; #allow mediaserver drmserver:unix_stream_socket connectto;
  allowcom -ipc init w; #allow mediaserver init:unix_stream_socket connectto;
  allowcom -ipc mediaserver r; #allow mediaserver mediaserver:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc mediaserver r; #allow mediaserver mediaserver:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc mediaserver r; #allow mediaserver mediaserver:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc mediaserver w; #allow mediaserver mediaserver:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc mediaserver w; #allow mediaserver mediaserver:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc mediaserver w; #allow mediaserver mediaserver:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc mediaserver_qmuxd_socket r; #allow mediaserver mediaserver_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc mediaserver_qmuxd_socket w; #allow mediaserver mediaserver_qmuxd_socket:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc mpdecision w; #allow mediaserver mpdecision:unix_dgram_socket sendto;
  allowcom -ipc qmux w; #allow mediaserver qmux:unix_stream_socket connectto;
  allowcom -ipc rild r; #allow mediaserver rild:unix_stream_socket { read write setopt connectto };
  allowcom -ipc rild w; #allow mediaserver rild:unix_stream_socket { read write setopt connectto };
  allowcom -ipc system_server r; #allow mediaserver system_server:fifo_file { read lock ioctl open getattr };
  allowcom -ipc system_server w; #allow mediaserver system_server:fifo_file { read lock ioctl open getattr };
  allowcom -ipc tee w; #allow mediaserver tee:unix_stream_socket connectto;
  allowcom -sig init c; #allow mediaserver init:process sigchld;
  allowcom -sig mediaserver c; #allow mediaserver mediaserver:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowcom -sig mediaserver k; #allow mediaserver mediaserver:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowcom -sig mediaserver n; #allow mediaserver mediaserver:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowcom -sig mediaserver o; #allow mediaserver mediaserver:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowcom -sig mediaserver s; #allow mediaserver mediaserver:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowdrm drmserver ;
  allowfs qtaguid_proc  r,s,w,x;
  allowfs sysfs  r,s,w,x;
  allownet -protocol raw use;
  allownet -protocol socket create;
  allownet -protocol socket rw;
  allowpriv execmem;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowprop persist.audio. ;
  allowsvc SurfaceFlinger f ;
  allowsvc activity f ;
  allowsvc appops f ;
  allowsvc batterystats f ;
  allowsvc common_time.clock a,f ;
  allowsvc common_time.config a,f ;
  allowsvc display.qservice f ;
  allowsvc drm.drmManager f ;
  allowsvc media.audio_flinger a,f ;
  allowsvc media.audio_policy a,f ;
  allowsvc media.camera a,f ;
  allowsvc media.camera.proxy f ;
  allowsvc media.log a,f ;
  allowsvc media.player a,f ;
  allowsvc media.radio a,f ;
  allowsvc media.resource_manager a,f ;
  allowsvc media.sound_trigger_hw a,f ;
  allowsvc permission f ;
  allowsvc power f ;
  allowsvc processinfo f ;
  allowsvc scheduling_policy f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow mediaserver app_data_file:dir search;" #path_list: 
  inline "allow mediaserver app_data_file:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow mediaserver drmserver_socket:sock_file write;" #path_list: 
  inline "allow mediaserver mediaserver:dir { read search ioctl open getattr };" #path_list: 
  inline "allow mediaserver mediaserver:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow mediaserver mediaserver:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow mediaserver mediaserver_qmuxd_socket:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };"
  inline "allow mediaserver mediaserver_qmuxd_socket:file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow mediaserver mediaserver_qmuxd_socket:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow mediaserver mediaserver_qmuxd_socket:sock_file { rename setattr read lock create getattr write ioctl unlink open append };"
  inline "allow mediaserver sdcard_type:dir { read search ioctl open getattr };" #path_list: 
  inline "allow mediaserver sdcard_type:file { read lock getattr write ioctl open };" #path_list: 
  inline "allow mediaserver sdcard_type:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "qmux_socket(mediaserver)"
  inline "type_transition mediaserver qmuxd_socket:dir mediaserver_qmuxd_socket;"
  inline "type_transition mediaserver qmuxd_socket:fifo_file mediaserver_qmuxd_socket;"
  inline "type_transition mediaserver qmuxd_socket:file mediaserver_qmuxd_socket;"
  inline "type_transition mediaserver qmuxd_socket:lnk_file mediaserver_qmuxd_socket;"
  inline "type_transition mediaserver qmuxd_socket:sock_file mediaserver_qmuxd_socket;"
}

