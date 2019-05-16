{
domain_name keystore : binderservicedomain,mlstrustedsubject;
domain_trans init /system/bin/keystore;
  allow /data/misc/keystore/** r,w,s,x;
  allow /dev/qseecom r,w,x,s;
  allow /dev/tf_driver r,w,x,s;
  allow /system/bin/keystore r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder bluetooth t ;
  allowbinder drmserver t ;
  allowbinder fingerprintd t ;
  allowbinder gatekeeperd t ;
  allowbinder healthd t ;
  allowbinder inputflinger t ;
  allowbinder keystore t ;
  allowbinder mediaserver t ;
  allowbinder nfc t ;
  allowbinder platform_app t ;
  allowbinder racoon t ;
  allowbinder radio t ;
  allowbinder servicemanager c ;
  allowbinder shared_relro t ;
  allowbinder shell t ;
  allowbinder su c ;
  allowbinder surfaceflinger t ;
  allowbinder system_app t ;
  allowbinder system_server t ;
  allowbinder untrusted_app t ;
  allowbinder wpa t ;
  allowcom -ipc keystore r; #allow keystore keystore:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc keystore r; #allow keystore keystore:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc keystore r; #allow keystore keystore:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc keystore w; #allow keystore keystore:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc keystore w; #allow keystore keystore:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc keystore w; #allow keystore keystore:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc keystore_data_file r; #allow keystore keystore_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc keystore_data_file w; #allow keystore keystore_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc tee w; #allow keystore tee:unix_stream_socket connectto;
  allowcom -sig init c; #allow keystore init:process sigchld;
  allowcom -sig keystore c; #allow keystore keystore:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig keystore k; #allow keystore keystore:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig keystore n; #allow keystore keystore:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig keystore o; #allow keystore keystore:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig keystore s; #allow keystore keystore:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allowfs selinuxfs  r,s,w,x;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv relabel;
  allowpriv setsecurity;
  allowsvc android.security.keystore a,f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow keystore binderservicedomain:dir search;" #path_list: 
  inline "allow keystore binderservicedomain:file { read open };" #path_list: 
  inline "allow keystore bluetooth:dir search;" #path_list: 
  inline "allow keystore bluetooth:file { read open };" #path_list: 
  inline "allow keystore fingerprintd:dir search;" #path_list: 
  inline "allow keystore fingerprintd:file { read open };" #path_list: 
  inline "allow keystore gatekeeperd:dir search;" #path_list: 
  inline "allow keystore gatekeeperd:file { read open };" #path_list: 
  inline "allow keystore keystore:dir { read search ioctl open getattr };" #path_list: 
  inline "allow keystore keystore:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow keystore keystore:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow keystore nfc:dir search;" #path_list: 
  inline "allow keystore nfc:file { read open };" #path_list: 
  inline "allow keystore platform_app:dir search;" #path_list: 
  inline "allow keystore platform_app:file { read open };" #path_list: 
  inline "allow keystore racoon:dir search;" #path_list: 
  inline "allow keystore racoon:file { read open };" #path_list: 
  inline "allow keystore radio:dir search;" #path_list: 
  inline "allow keystore radio:file { read open };" #path_list: 
  inline "allow keystore selinuxfs:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow keystore shared_relro:dir search;" #path_list: 
  inline "allow keystore shared_relro:file { read open };" #path_list: 
  inline "allow keystore shell:dir search;" #path_list: 
  inline "allow keystore shell:file { read open };" #path_list: 
  inline "allow keystore su:dir search;" #path_list: 
  inline "allow keystore su:file { read open };" #path_list: 
  inline "allow keystore system_app:dir search;" #path_list: 
  inline "allow keystore system_app:file { read open };" #path_list: 
  inline "allow keystore untrusted_app:dir search;" #path_list: 
  inline "allow keystore untrusted_app:file { read open };" #path_list: 
  inline "allow keystore wpa:dir search;" #path_list: 
  inline "allow keystore wpa:file { read open };" #path_list: 
}

