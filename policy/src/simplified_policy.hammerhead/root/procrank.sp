{
domain_name procrank : mlstrustedsubject;
domain_trans dumpstate /system/xbin/procrank;
domain_trans shell /system/xbin/procrank;
  allow /data/local/tmp/** r,w,x,s;
  allow /dev/pts r,w,s;
  allow /mnt/expand/[^/]+/local/tmp/** r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/procrank r,w,x,s;
  allowbinder su c ;
  allowcom -ipc dumpstate r; #allow procrank dumpstate:unix_stream_socket { read write getattr };
  allowcom -ipc dumpstate w; #allow procrank dumpstate:unix_stream_socket { read write getattr };
  allowcom -ipc procrank r; #allow procrank procrank:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc procrank r; #allow procrank procrank:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc procrank r; #allow procrank procrank:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc procrank w; #allow procrank procrank:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc procrank w; #allow procrank procrank:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc procrank w; #allow procrank procrank:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig adbd c; #allow procrank adbd:process sigchld;
  allowcom -sig dumpstate c; #allow procrank dumpstate:process sigchld;
  allowcom -sig procrank c; #allow procrank procrank:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig procrank k; #allow procrank procrank:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig procrank n; #allow procrank procrank:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig procrank o; #allow procrank procrank:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig procrank s; #allow procrank procrank:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig shell c; #allow procrank shell:process sigchld;
  allowdev -pts devpts r;
allowdev -pts devpts w;

  allowdev -root /dev;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  inline "allow procrank domain:dir { read search ioctl open getattr };" #path_list: 
  inline "allow procrank domain:file { read lock ioctl open getattr };" #path_list: 
  inline "allow procrank domain:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow procrank procrank:dir { read search ioctl open getattr };" #path_list: 
  inline "allow procrank procrank:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow procrank procrank:lnk_file { read lock ioctl open getattr };" #path_list: 
}

