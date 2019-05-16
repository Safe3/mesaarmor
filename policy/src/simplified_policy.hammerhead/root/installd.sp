{
domain_name installd : mlstrustedsubject;
domain_trans init /system/bin/installd;
  allow /data/** r,w,s;
  allow /data/.layout_version r,w,x,s;
  allow /data/app-asec/** r,s;
  allow /data/app/** r,w,s,x;
  allow /data/app/[^/]+/oat/** r,w,s,x;
  allow /data/app/vmdl[^/]+\.tmp/** r,w,s,x;
  allow /data/app/vmdl[^/]+\.tmp/oat/** r,w,s,x;
  allow /data/dalvik-cache/** r,w,s,x;
  allow /data/dalvik-cache/profiles/** r,w,s,x;
  allow /data/local/tmp/** r,w,s,x;
  allow /data/media/** r,w,s;
  allow /data/misc/bluedroid/** r,w,s,x;
  allow /data/misc/bluetooth/** r,w,s,x;
  allow /data/misc/keychain/** r,w,s,x;
  allow /data/misc/sms/** r,w,s,x;
  allow /data/misc/user/** r,w,s,x;
  allow /data/nfc/** r,w,s,x;
  allow /data/resource-cache/** r,w,s,x;
  allow /data/security/** r,w,s,x;
  allow /dev/pts r,w,x,s;
  allow /mnt/asec/** r,w,x,s;
  allow /mnt/expand/** s;
  allow /mnt/expand/[^/]+/** r,w,s;
  allow /mnt/expand/[^/]+/app/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/[^/]+/oat/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/vmdl[^/]+\.tmp/** r,w,s,x;
  allow /mnt/expand/[^/]+/app/vmdl[^/]+\.tmp/oat/** r,w,s,x;
  allow /mnt/expand/[^/]+/local/tmp/** r,w,s,x;
  allow /mnt/expand/[^/]+/media/** r,w,s;
  allow /odm/** r,x,s;
  allow /oem/** r,w,s,x;
  allow /system/** r,x,s;
  allow /system/bin/dex2oat r,w,x,s;
  allow /system/bin/installd r,w,x,s;
  allow /system/bin/logwrapper r,x,s;
  allow /system/bin/patchoat r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/xbin/simpleperf r,x,s;
  allow /vendor/** r,x,s;
  allowbinder su c ;
  allowcom -ipc app_data_file r; #allow installd app_data_file:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc app_data_file w; #allow installd app_data_file:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc bluetooth_data_file r; #allow installd bluetooth_data_file:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc bluetooth_data_file w; #allow installd bluetooth_data_file:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc installd r; #allow installd installd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc installd r; #allow installd installd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc installd r; #allow installd installd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc installd w; #allow installd installd:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc installd w; #allow installd installd:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc installd w; #allow installd installd:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc nfc_data_file r; #allow installd nfc_data_file:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc nfc_data_file w; #allow installd nfc_data_file:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc radio_data_file r; #allow installd radio_data_file:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc radio_data_file w; #allow installd radio_data_file:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc shell_data_file r; #allow installd shell_data_file:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc shell_data_file w; #allow installd shell_data_file:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc system_app_data_file r; #allow installd system_app_data_file:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc system_app_data_file w; #allow installd system_app_data_file:fifo_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };
  allowcom -ipc system_data_file r; #allow installd system_data_file:fifo_file { relabelfrom getattr unlink };
  allowcom -ipc system_data_file w; #allow installd system_data_file:fifo_file { relabelfrom getattr unlink };
  allowcom -ipc unlabeled r; #allow installd unlabeled:fifo_file { relabelfrom rename getattr unlink setattr };
  allowcom -ipc unlabeled w; #allow installd unlabeled:fifo_file { relabelfrom rename getattr unlink setattr };
  allowcom -sig init c; #allow installd init:process sigchld;
  allowcom -sig installd c; #allow installd installd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig installd k; #allow installd installd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig installd n; #allow installd installd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig installd o; #allow installd installd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig installd s; #allow installd installd:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowdev -pts devpts r;
allowdev -pts devpts w;

  allowdev -root /dev;
  allowfs cgroup  w,r,s;
  allowfs selinuxfs  r,s,w,x;
  allowpriv cap_chown;
  allowpriv cap_dac_override;
  allowpriv cap_fowner;
  allowpriv cap_fsetid;
  allowpriv cap_setgid;
  allowpriv cap_setuid;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv part_relabel;
  allowpriv relabel;
  allowpriv setsecurity;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow installd app_data_file:dir { rename search setattr read create reparent getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };" #path_list: 
  inline "allow installd app_data_file:file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };" #path_list: 
  inline "allow installd app_data_file:lnk_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };" #path_list: 
  inline "allow installd app_data_file:sock_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };" #path_list: 
  inline "allow installd cgroup:dir { rename search setattr read create reparent getattr write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow installd dex2oat:process transition;"
  inline "allow installd installd:dir { read search ioctl open getattr };" #path_list: 
  inline "allow installd installd:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow installd installd:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow installd selinuxfs:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow installd system_app_data_file:dir { rename search setattr read create reparent getattr write relabelfrom ioctl rmdir remove_name relabelto open add_name };" #path_list: 
  inline "allow installd system_app_data_file:file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };" #path_list: 
  inline "allow installd system_app_data_file:lnk_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };" #path_list: 
  inline "allow installd system_app_data_file:sock_file { rename setattr read lock create getattr write relabelfrom ioctl relabelto unlink open append };" #path_list: 
  inline "allow installd unlabeled:dir { search read getattr write relabelfrom ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow installd unlabeled:file { rename setattr read lock getattr relabelfrom ioctl unlink open };" #path_list: 
  inline "allow installd unlabeled:lnk_file { relabelfrom rename getattr unlink setattr };" #path_list: 
  inline "allow installd unlabeled:sock_file { relabelfrom rename getattr unlink setattr };" #path_list: 
  inline "type_transition installd system_data_file:file install_data_file;"
}

