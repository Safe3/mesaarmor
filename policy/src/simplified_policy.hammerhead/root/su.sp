{
domain_name su : appdomain,netdomain,mlstrustedsubject;
domain_trans dumpstate /system/xbin/su;
domain_trans runas;
domain_trans shell /system/xbin/su;
domain_trans adbd;
domain_trans zygote;
  
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /system/bin/dumpstate r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/su r,w,x,s;
  allowbinder adbd t ;
  allowbinder blkid t ;
  allowbinder blkid_untrusted t ;
  allowbinder bluetooth t ;
  allowbinder bluetooth_loader t ;
  allowbinder bootanim t ;
  allowbinder bridge t ;
  allowbinder camera t ;
  allowbinder clatd t ;
  allowbinder debuggerd t ;
  allowbinder dex2oat t ;
  allowbinder dhcp t ;
  allowbinder dnsmasq t ;
  allowbinder drmserver t ;
  allowbinder dumpstate t ;
  allowbinder fingerprintd t ;
  allowbinder fsck t ;
  allowbinder fsck_untrusted t ;
  allowbinder gatekeeperd t ;
  allowbinder gpsd t ;
  allowbinder hci_attach t ;
  allowbinder healthd t ;
  allowbinder hostapd t ;
  allowbinder inputflinger t ;
  allowbinder install_recovery t ;
  allowbinder installd t ;
  allowbinder irsc_util t ;
  allowbinder isolated_app t ;
  allowbinder kernel t ;
  allowbinder keystore c ;
  allowbinder lmkd t ;
  allowbinder logd t ;
  allowbinder mdnsd t ;
  allowbinder mediaserver t ;
  allowbinder mpdecision t ;
  allowbinder mtp t ;
  allowbinder netd t ;
  allowbinder netmgrd t ;
  allowbinder nfc t ;
  allowbinder perfprofd t ;
  allowbinder platform_app t ;
  allowbinder ppp t ;
  allowbinder procrank t ;
  allowbinder qmux t ;
  allowbinder racoon t ;
  allowbinder radio t ;
  allowbinder recovery t ;
  allowbinder rild t ;
  allowbinder rmt t ;
  allowbinder runas t ;
  allowbinder sdcardd t ;
  allowbinder sensors t ;
  allowbinder servicemanager t ;
  allowbinder sgdisk t ;
  allowbinder shared_relro t ;
  allowbinder shell t ;
  allowbinder slideshow t ;
  allowbinder ssr t ;
  allowbinder su c ;
  allowbinder surfaceflinger t ;
  allowbinder system_app t ;
  allowbinder system_server t ;
  allowbinder tee t ;
  allowbinder thermald t ;
  allowbinder time t ;
  allowbinder toolbox t ;
  allowbinder tzdatacheck t ;
  allowbinder ueventd t ;
  allowbinder uncrypt t ;
  allowbinder untrusted_app t ;
  allowbinder vdc t ;
  allowbinder vold t ;
  allowbinder vss t ;
  allowbinder watchdogd t ;
  allowbinder wpa t ;
  allowbinder zygote t ;
  allowcom -ipc app_data_file r; #allow su app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc app_data_file w; #allow su app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc su r; #allow su su:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc su r; #allow su su:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc su r; #allow su su:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc su w; #allow su su:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc su w; #allow su su:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc su w; #allow su su:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig dumpstate c; #allow su dumpstate:process { siginh transition sigchld rlimitinh };
  allowcom -sig shell c; #allow su shell:process sigchld;
  allowcom -sig su c; #allow su su:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig su k; #allow su su:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig su n; #allow su su:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig su o; #allow su su:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig su s; #allow su su:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
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
  allowsvc android.security.keystore f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow su app_data_file:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow su app_data_file:file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow su app_data_file:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow su app_data_file:sock_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow su dumpstate:process transition;"
  inline "allow su su:dir { read search ioctl open getattr };" #path_list: 
  inline "allow su su:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow su su:lnk_file { read lock ioctl open getattr };" #path_list: 
}

