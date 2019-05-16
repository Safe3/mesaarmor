{
domain_name servicemanager : mlstrustedsubject;
domain_trans init /system/bin/servicemanager;
  allow /system/bin/servicemanager r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
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
  allowbinder keystore t ;
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
  allowbinder servicemanager m ;
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
  allowcom -ipc servicemanager r; #allow servicemanager servicemanager:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc servicemanager r; #allow servicemanager servicemanager:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc servicemanager r; #allow servicemanager servicemanager:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc servicemanager w; #allow servicemanager servicemanager:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc servicemanager w; #allow servicemanager servicemanager:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc servicemanager w; #allow servicemanager servicemanager:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow servicemanager init:process sigchld;
  allowcom -sig servicemanager c; #allow servicemanager servicemanager:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig servicemanager k; #allow servicemanager servicemanager:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig servicemanager n; #allow servicemanager servicemanager:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig servicemanager o; #allow servicemanager servicemanager:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig servicemanager s; #allow servicemanager servicemanager:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowfs selinuxfs  r,s,w,x;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow servicemanager adbd:dir search;" #path_list: 
  inline "allow servicemanager adbd:file { read open };" #path_list: 
  inline "allow servicemanager appdomain:dir search;" #path_list: 
  inline "allow servicemanager appdomain:file { read open };" #path_list: 
  inline "allow servicemanager bootanim:dir search;" #path_list: 
  inline "allow servicemanager bootanim:file { read open };" #path_list: 
  inline "allow servicemanager drmserver:dir search;" #path_list: 
  inline "allow servicemanager drmserver:file { read open };" #path_list: 
  inline "allow servicemanager dumpstate:dir search;" #path_list: 
  inline "allow servicemanager dumpstate:file { read open };" #path_list: 
  inline "allow servicemanager fingerprintd:dir search;" #path_list: 
  inline "allow servicemanager fingerprintd:file { read open };" #path_list: 
  inline "allow servicemanager gatekeeperd:dir search;" #path_list: 
  inline "allow servicemanager gatekeeperd:file { read open };" #path_list: 
  inline "allow servicemanager healthd:dir search;" #path_list: 
  inline "allow servicemanager healthd:file { read open };" #path_list: 
  inline "allow servicemanager inputflinger:dir search;" #path_list: 
  inline "allow servicemanager inputflinger:file { read open };" #path_list: 
  inline "allow servicemanager keystore:dir search;" #path_list: 
  inline "allow servicemanager keystore:file { read open };" #path_list: 
  inline "allow servicemanager mediaserver:dir search;" #path_list: 
  inline "allow servicemanager mediaserver:file { read open };" #path_list: 
  inline "allow servicemanager racoon:dir search;" #path_list: 
  inline "allow servicemanager racoon:file { read open };" #path_list: 
  inline "allow servicemanager selinuxfs:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow servicemanager servicemanager:dir { read search ioctl open getattr };" #path_list: 
  inline "allow servicemanager servicemanager:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow servicemanager servicemanager:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow servicemanager surfaceflinger:dir search;" #path_list: 
  inline "allow servicemanager surfaceflinger:file { read open };" #path_list: 
  inline "allow servicemanager system_server:dir search;" #path_list: 
  inline "allow servicemanager system_server:file { read open };" #path_list: 
  inline "allow servicemanager vold:dir search;" #path_list: 
  inline "allow servicemanager vold:file { read open };" #path_list: 
  inline "allow servicemanager wpa:dir search;" #path_list: 
  inline "allow servicemanager wpa:file { read open };" #path_list: 
}

