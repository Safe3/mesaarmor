{
domain_name toolbox;
domain_trans init /system/bin/toybox;
domain_trans init /system/bin/toolbox;
  allow /dev/block/** s;
  allow /dev/pts r,w,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc toolbox r; #allow toolbox toolbox:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc toolbox r; #allow toolbox toolbox:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc toolbox r; #allow toolbox toolbox:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc toolbox w; #allow toolbox toolbox:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc toolbox w; #allow toolbox toolbox:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc toolbox w; #allow toolbox toolbox:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow toolbox init:process sigchld;
  allowcom -sig toolbox c; #allow toolbox toolbox:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig toolbox k; #allow toolbox toolbox:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig toolbox n; #allow toolbox toolbox:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig toolbox o; #allow toolbox toolbox:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig toolbox s; #allow toolbox toolbox:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -pts devpts r;
allowdev -pts devpts w;

  allowdev -root /dev;
  allowfs tmpfs  r,s,w;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow toolbox swap_block_device:blk_file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow toolbox tmpfs:chr_file { read write ioctl };"
  inline "allow toolbox toolbox:dir { read search ioctl open getattr };" #path_list: 
  inline "allow toolbox toolbox:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow toolbox toolbox:lnk_file { read lock ioctl open getattr };" #path_list: 
}

