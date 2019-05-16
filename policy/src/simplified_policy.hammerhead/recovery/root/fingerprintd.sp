{
domain_name fingerprintd;
domain_trans init /system/bin/fingerprintd;
  allow /data/system/users/[0-9]+/fpdata/** r,w,s,x;
  allow /system/bin/fingerprintd r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder keystore c ;
  allowbinder servicemanager c ;
  allowbinder su c ;
  allowbinder system_server c ;
  allowcom -ipc fingerprintd r; #allow fingerprintd fingerprintd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc fingerprintd r; #allow fingerprintd fingerprintd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc fingerprintd r; #allow fingerprintd fingerprintd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc fingerprintd w; #allow fingerprintd fingerprintd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc fingerprintd w; #allow fingerprintd fingerprintd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc fingerprintd w; #allow fingerprintd fingerprintd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig fingerprintd c; #allow fingerprintd fingerprintd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig fingerprintd k; #allow fingerprintd fingerprintd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig fingerprintd n; #allow fingerprintd fingerprintd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig fingerprintd o; #allow fingerprintd fingerprintd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig fingerprintd s; #allow fingerprintd fingerprintd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig init c; #allow fingerprintd init:process sigchld;
  allowks keystore a ;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv relabel;
  allowpriv setsecurity;
  allowsvc android.hardware.fingerprint.IFingerprintDaemon a,f ;
  allowsvc android.security.keystore f ;
  allowsvc permission f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow fingerprintd fingerprintd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow fingerprintd fingerprintd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow fingerprintd fingerprintd:lnk_file { read lock ioctl open getattr };" #path_list: 
}

