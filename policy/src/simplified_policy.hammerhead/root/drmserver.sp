{
domain_name drmserver : netdomain,binderservicedomain,mlstrustedsubject;
domain_trans init /system/bin/drmserver;
  
  allow /data/app/** r,w,s;
  allow /data/drm/** r,w,s,x;
  allow /data/media/** r,w,s,x;
  allow /data/misc/playready/** r,w,s,x;
  allow /data/misc/sms/** r,s;
  allow /dev/qseecom r,w,x,s;
  allow /dev/tf_driver r,w,x,s;
  allow /efs/** r,w,s,x;
  allow /mnt/asec/** r,s;
  allow /mnt/expand/[^/]+/app/** r,w,s;
  allow /mnt/expand/[^/]+/media/** r,w,s,x;
  allow /oem/** r,w,x,s;
  allow /system/bin/drmserver r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder bluetooth c ;
  allowbinder isolated_app c ;
  allowbinder mediaserver c ;
  allowbinder nfc c ;
  allowbinder platform_app c ;
  allowbinder radio c ;
  allowbinder servicemanager c ;
  allowbinder shared_relro c ;
  allowbinder shell c ;
  allowbinder su c ;
  allowbinder system_app c ;
  allowbinder system_server c ;
  allowbinder untrusted_app c ;
  allowcom -ipc drmserver r; #allow drmserver drmserver:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc drmserver r; #allow drmserver drmserver:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc drmserver r; #allow drmserver drmserver:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc drmserver w; #allow drmserver drmserver:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc drmserver w; #allow drmserver drmserver:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc drmserver w; #allow drmserver drmserver:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc tee w; #allow drmserver tee:unix_stream_socket connectto;
  allowcom -sig drmserver c; #allow drmserver drmserver:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig drmserver k; #allow drmserver drmserver:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig drmserver n; #allow drmserver drmserver:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig drmserver o; #allow drmserver drmserver:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig drmserver s; #allow drmserver drmserver:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig init c; #allow drmserver init:process sigchld;
  allowdev -root /dev;
  allowfs selinuxfs  r,s,w,x;
  allownet -protocol raw use;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowsvc drm.drmManager a,f ;
  allowsvc permission f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow drmserver app_data_file:file { read write getattr };" #path_list: 
  inline "allow drmserver drmserver:dir { read search ioctl open getattr };" #path_list: 
  inline "allow drmserver drmserver:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow drmserver drmserver:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow drmserver drmserver_socket:sock_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow drmserver mediaserver:dir search;" #path_list: 
  inline "allow drmserver mediaserver:file { read open };" #path_list: 
  inline "allow drmserver sdcard_type:dir search;" #path_list: 
  inline "allow drmserver sdcard_type:file { read write getattr };" #path_list: 
  inline "allow drmserver selinuxfs:file { read lock getattr write ioctl open append };" #path_list: 
  inline "type_transition drmserver apk_data_file:sock_file drmserver_socket;"
}

