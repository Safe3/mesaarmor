{
domain_name shared_relro : appdomain;
domain_trans runas;
domain_trans zygote;
  allow /data/misc/shared_relro/** r,w,s,x;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder keystore c ;
  allowbinder su c ;
  allowcom -ipc app_data_file r; #allow shared_relro app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc app_data_file w; #allow shared_relro app_data_file:fifo_file { rename setattr read lock create getattr write ioctl unlink open append };
  allowcom -ipc shared_relro r; #allow shared_relro shared_relro:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc shared_relro r; #allow shared_relro shared_relro:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc shared_relro r; #allow shared_relro shared_relro:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc shared_relro w; #allow shared_relro shared_relro:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc shared_relro w; #allow shared_relro shared_relro:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc shared_relro w; #allow shared_relro shared_relro:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig shared_relro c; #allow shared_relro shared_relro:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig shared_relro k; #allow shared_relro shared_relro:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig shared_relro n; #allow shared_relro shared_relro:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig shared_relro o; #allow shared_relro shared_relro:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowcom -sig shared_relro s; #allow shared_relro shared_relro:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop execmem getcap getpgid ptrace signull setrlimit getsched };
  allowdev -root /dev;
  allowks keystore i,g,s ;
  allowpriv execmem;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv netlink;
  allowpriv ptrace;
  allowpriv relabel;
  allowpriv setsecurity;
  allowsvc android.security.keystore f ;
  allowsvc webviewupdate f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow shared_relro app_data_file:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow shared_relro app_data_file:file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow shared_relro app_data_file:lnk_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow shared_relro app_data_file:sock_file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow shared_relro shared_relro:dir { read search ioctl open getattr };" #path_list: 
  inline "allow shared_relro shared_relro:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow shared_relro shared_relro:lnk_file { read lock ioctl open getattr };" #path_list: 
}

