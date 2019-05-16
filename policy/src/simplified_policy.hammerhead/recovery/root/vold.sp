{
domain_name vold : mlstrustedsubject;
domain_trans init /system/bin/vold;
  allow /data/** r,w,s;
  allow /data/app-asec/** r,w,s,x;
  allow /data/app/** r,w,s;
  allow /data/local/tmp/** r,w,s;
  allow /data/media/** r,w,s,x;
  allow /data/misc/vold/** r,w,s,x;
  allow /data/security/** r,w,s,x;
  allow /data/unencrypted/** r,w,s,x;
  allow /dev/** r,w,s;
  allow /dev/block/** r,w,s,x;
  allow /dev/block/dm-[0-9]+ r,w,s,x;
  allow /dev/block/loop[0-9]* r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/metadata r,w,x,s;
  allow /dev/block/platform/msm_sdcc\.1/by-name/userdata r,w,x,s;
  allow /dev/block/vold/.+ r,w,x,s;
  allow /dev/device-mapper r,w,s,x;
  allow /dev/fscklogs/** r,w,s,x;
  allow /dev/kmsg r,w,x,s;
  allow /dev/pts r,w,x,s;
  allow /dev/qseecom r,w,x,s;
  allow /dev/socket/property_service r,w,s;
  allow /dev/tf_driver r,w,x,s;
  allow /efs/** r,w,x,s;
  allow /mnt/asec/** r,w,s,x;
  allow /mnt/asec/[^/]+/[^/]+\.zip r,w,s;
  allow /mnt/asec/[^/]+/lib/** r,w,s;
  allow /mnt/expand/** r,w,s;
  allow /mnt/expand/[^/]+/** r,w,s;
  allow /mnt/expand/[^/]+/app/** r,w,s;
  allow /mnt/expand/[^/]+/local/tmp/** r,w,s;
  allow /mnt/expand/[^/]+/media/** r,w,s,x;
  allow /mnt/expand/[^/]+/misc/vold/** r,w,s,x;
  allow /mnt/media_rw/** r,w,s,x;
  allow /mnt/runtime/** r,w,s,x;
  allow /mnt/user/** r,w,s;
  allow /odm/** r,x,s;
  allow /proc/sys/vm/drop_caches r,w,x,s;
  allow /storage/** r,w,s,x;
  allow /sys/** r,w,x,s;
  allow /sys/power/wake_lock r,w,x,s;
  allow /sys/power/wake_unlock r,w,x,s;
  allow /system/** r,x,s;
  allow /system/bin/e2fsck r,w,x,s;
  allow /system/bin/fsck\.f2fs r,w,x,s;
  allow /system/bin/fsck_msdos r,w,x,s;
  allow /system/bin/logwrapper r,x,s;
  allow /system/bin/sdcard r,w,x,s;
  allow /system/bin/sgdisk r,w,x,s;
  allow /system/bin/sh r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allow /system/bin/vold r,w,x,s;
  allow /system/xbin/simpleperf r,x,s;
  allow /vendor/** r,x,s;
  allowbinder healthd c ;
  allowbinder servicemanager c ;
  allowbinder su c ;
  allowcom -ipc init w; #allow vold init:unix_stream_socket connectto;
  allowcom -ipc vold r; #allow vold vold:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc vold r; #allow vold vold:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc vold r; #allow vold vold:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc vold w; #allow vold vold:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc vold w; #allow vold vold:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc vold w; #allow vold vold:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig domain k; #allow vold domain:process { signal sigkill };
  allowcom -sig domain o; #allow vold domain:process { signal sigkill };
  allowcom -sig init c; #allow vold init:process sigchld;
  allowcom -sig vold c; #allow vold vold:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setexec setfscreate signull setrlimit };
  allowcom -sig vold k; #allow vold vold:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setexec setfscreate signull setrlimit };
  allowcom -sig vold n; #allow vold vold:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setexec setfscreate signull setrlimit };
  allowcom -sig vold o; #allow vold vold:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setexec setfscreate signull setrlimit };
  allowcom -sig vold s; #allow vold vold:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched setexec setfscreate signull setrlimit };
  allowdev -pts devpts r;
allowdev -pts devpts w;

  allowdev -root /dev;
  allowfs proc_drop_caches  w,r,s,x;
  allowfs sysfs  r,s,w,x;
  allowfs tmpfs  w,r,s;
  allowkey init s ;
  allowkey init t ;
  allowkey init w ;
  allowkey vold s ;
  allowkey vold t ;
  allowkey vold w ;
  allowpriv cap2_block_suspend;
  allowpriv cap_chown;
  allowpriv cap_dac_override;
  allowpriv cap_fowner;
  allowpriv cap_fsetid;
  allowpriv cap_net_admin;
  allowpriv cap_sys_admin;
  allowpriv cap_sys_chroot;
  allowpriv cap_sys_nice;
  allowpriv devcreate;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv mount;
  allowpriv netlink;
  allowpriv part_relabel;
  allowpriv relabel;
  allowpriv setsecurity;
  allowprop crypto. ;
  allowprop ctl.fuse_ ;
  allowprop selinux.restorecon_recursive ;
  allowprop sys.powerctl ;
  allowprop vold. ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow vold app_data_file:dir search;" #path_list: 
  inline "allow vold app_data_file:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow vold blkid:process transition;"
  inline "allow vold blkid_untrusted:process transition;"
  inline "allow vold domain:dir { read search ioctl open getattr };" #path_list: 
  inline "allow vold domain:file { read lock ioctl open getattr };" #path_list: 
  inline "allow vold domain:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "allow vold fsck:process transition;"
  inline "allow vold fsck_untrusted:process transition;"
  inline "allow vold mnt_media_rw_stub_file:dir { rmdir create getattr setattr mounton };"
  inline "allow vold sdcard_type:dir { rename search setattr read create reparent getattr mounton write ioctl rmdir remove_name open add_name };" #path_list: 
  inline "allow vold sdcard_type:file { rename setattr read lock create getattr write ioctl unlink open append };" #path_list: 
  inline "allow vold sdcardd:process transition;"
  inline "allow vold sgdisk:process transition;"
  inline "allow vold storage_stub_file:dir { rmdir create getattr setattr mounton };"
  inline "allow vold tmpfs:dir { rename search setattr read create reparent getattr mounton write ioctl rmdir remove_name open add_name };"
  inline "allow vold unlabeled:dir { search setattr read getattr relabelfrom ioctl open };" #path_list: 
  inline "allow vold unlabeled:file { setattr read lock getattr relabelfrom ioctl open };" #path_list: 
  inline "allow vold vold:dir { read search ioctl open getattr };" #path_list: 
  inline "allow vold vold:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow vold vold:lnk_file { read lock ioctl open getattr };" #path_list: 
  inline "type_transition vold mnt_media_rw_file:dir mnt_media_rw_stub_file;"
  inline "type_transition vold storage_file:dir storage_stub_file;"
}

