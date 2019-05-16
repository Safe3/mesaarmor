{
domain_name bluetooth_loader;
domain_trans init /system/bin/bdAddrLoader;
  allow /dev/socket/property_service r,w,s;
  allow /persist/** s;
  allow /persist/bluetooth/** r,w,s,x;
  allow /system/bin/bdAddrLoader r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc bluetooth_loader r; #allow bluetooth_loader bluetooth_loader:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc bluetooth_loader r; #allow bluetooth_loader bluetooth_loader:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc bluetooth_loader r; #allow bluetooth_loader bluetooth_loader:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc bluetooth_loader w; #allow bluetooth_loader bluetooth_loader:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc bluetooth_loader w; #allow bluetooth_loader bluetooth_loader:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc bluetooth_loader w; #allow bluetooth_loader bluetooth_loader:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc init w; #allow bluetooth_loader init:unix_stream_socket connectto;
  allowcom -sig bluetooth_loader c; #allow bluetooth_loader bluetooth_loader:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig bluetooth_loader k; #allow bluetooth_loader bluetooth_loader:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig bluetooth_loader n; #allow bluetooth_loader bluetooth_loader:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig bluetooth_loader o; #allow bluetooth_loader bluetooth_loader:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig bluetooth_loader s; #allow bluetooth_loader bluetooth_loader:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig init c; #allow bluetooth_loader init:process sigchld;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  allowprop bluetooth. ;
  allowprop persist.service.bdroid. ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow bluetooth_loader bluetooth_loader:dir { read search ioctl open getattr };" #path_list: 
  inline "allow bluetooth_loader bluetooth_loader:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow bluetooth_loader bluetooth_loader:lnk_file { read lock ioctl open getattr };" #path_list: 
}

