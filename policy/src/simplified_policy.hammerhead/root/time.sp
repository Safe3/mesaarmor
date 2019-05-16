{
domain_name time : mlstrustedsubject;
domain_trans init /system/bin/time_daemon;
  allow /data/system/time/** r,w,s,x;
  allow /dev/alarm r,w,x,s;
  allow /dev/rtc[0-9] r,w,x,s;
  allow /dev/smem_log r,w,x,s;
  allow /storage r,w,s,x;
  allow /system/bin/time_daemon r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder su c ;
  allowcom -ipc time r; #allow time time:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc time r; #allow time time:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc time r; #allow time time:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc time w; #allow time time:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc time w; #allow time time:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc time w; #allow time time:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig init c; #allow time init:process sigchld;
  allowcom -sig time c; #allow time time:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig time k; #allow time time:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig time n; #allow time time:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig time o; #allow time time:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig time s; #allow time time:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -root /dev;
  allownet -protocol socket create;
  allownet -protocol socket rw;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
}

