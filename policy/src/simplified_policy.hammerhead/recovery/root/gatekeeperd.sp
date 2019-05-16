{
domain_name gatekeeperd : binderservicedomain;
domain_trans init /system/bin/gatekeeperd;
  allow /data/misc/gatekeeper/** r,w,s,x;
  allow /dev/qseecom r,w,x,s;
  allow /dev/tf_driver r,w,x,s;
  allow /system/bin/gatekeeperd r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder keystore c ;
  allowbinder servicemanager c ;
  allowbinder su c ;
  allowbinder system_server c ;
  allowcom -ipc gatekeeperd r; #allow gatekeeperd gatekeeperd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc gatekeeperd r; #allow gatekeeperd gatekeeperd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc gatekeeperd r; #allow gatekeeperd gatekeeperd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc gatekeeperd w; #allow gatekeeperd gatekeeperd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc gatekeeperd w; #allow gatekeeperd gatekeeperd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc gatekeeperd w; #allow gatekeeperd gatekeeperd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig gatekeeperd c; #allow gatekeeperd gatekeeperd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig gatekeeperd k; #allow gatekeeperd gatekeeperd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig gatekeeperd n; #allow gatekeeperd gatekeeperd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig gatekeeperd o; #allow gatekeeperd gatekeeperd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig gatekeeperd s; #allow gatekeeperd gatekeeperd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig init c; #allow gatekeeperd init:process sigchld;
  allowdev -root /dev;
  allowks keystore a ;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv relabel;
  allowpriv setsecurity;
  allowsvc android.security.keystore f ;
  allowsvc android.service.gatekeeper.IGateKeeperService a,f ;
  allowsvc permission f ;
  allowsvc user f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow gatekeeperd gatekeeperd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow gatekeeperd gatekeeperd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow gatekeeperd gatekeeperd:lnk_file { read lock ioctl open getattr };" #path_list: 
}

