{
domain_name runas : mlstrustedsubject;
domain_trans shell /system/bin/run-as;
  allow /data/** r,w,x,s;
  allow /data/local/tmp/** r,w,s;
  allow /data/security/** r,w,s,x;
  allow /dev/pts r,w,s;
  allow /mnt/expand/[^/]+/** r,w,x,s;
  allow /mnt/expand/[^/]+/local/tmp/** r,w,s;
  allow /system/bin/run-as r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc runas r; #allow runas runas:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc runas r; #allow runas runas:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc runas r; #allow runas runas:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc runas w; #allow runas runas:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc runas w; #allow runas runas:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc runas w; #allow runas runas:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc shell r; #allow runas shell:fifo_file { read write };
  allowcom -ipc shell w; #allow runas shell:fifo_file { read write };
  allowcom -sig adbd c; #allow runas adbd:process sigchld;
  allowcom -sig runas c; #allow runas runas:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig runas k; #allow runas runas:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig runas n; #allow runas runas:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig runas o; #allow runas runas:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig runas s; #allow runas runas:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setcurrent setrlimit };
  allowcom -sig shell c; #allow runas shell:process { dyntransition sigchld };
  allowdev -pts devpts r;
allowdev -pts devpts w;

  allowdev -root /dev;
  allowfs selinuxfs  r,s,w,x;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  inline "allow runas app_data_file:dir { getattr search };" #path_list: 
  inline "allow runas runas:dir { read search ioctl open getattr };" #path_list: 
  inline "allow runas runas:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow runas runas:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow runas selinuxfs:file { read lock getattr write ioctl open append };" #path_list: 
}

