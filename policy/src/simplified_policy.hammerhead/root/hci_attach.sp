{
domain_name hci_attach;
domain_trans init;
  allow /dev/ttyHS99 r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc hci_attach r; #allow hci_attach hci_attach:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc hci_attach r; #allow hci_attach hci_attach:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc hci_attach r; #allow hci_attach hci_attach:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc hci_attach w; #allow hci_attach hci_attach:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc hci_attach w; #allow hci_attach hci_attach:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc hci_attach w; #allow hci_attach hci_attach:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig hci_attach c; #allow hci_attach hci_attach:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig hci_attach k; #allow hci_attach hci_attach:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig hci_attach n; #allow hci_attach hci_attach:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig hci_attach o; #allow hci_attach hci_attach:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig hci_attach s; #allow hci_attach hci_attach:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig init c; #allow hci_attach init:process sigchld;
  allowdev -root /dev;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow hci_attach bluetooth_efs_file:dir { read search ioctl open getattr };" #path_list: 
  inline "allow hci_attach bluetooth_efs_file:file { read lock ioctl open getattr };" #path_list: 
  inline "allow hci_attach hci_attach:dir { read search ioctl open getattr };" #path_list: 
  inline "allow hci_attach hci_attach:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow hci_attach hci_attach:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow hci_attach hci_attach_exec:file { read open getattr entrypoint execute };"
}

