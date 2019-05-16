{
domain_name bootanim;
domain_trans init /system/bin/bootanimation;
  allow /dev/audio.* r,w,s,x;
  allow /dev/eac r,w,s,x;
  allow /dev/kgsl r,w,x,s;
  allow /dev/kgsl-3d0 r,w,x,s;
  allow /dev/msm_aac.* r,w,s,x;
  allow /dev/msm_acdb r,w,s,x;
  allow /dev/msm_amrnb.* r,w,s,x;
  allow /dev/msm_amrwb.* r,w,s,x;
  allow /dev/msm_mp3 r,w,s,x;
  allow /dev/msm_rtac r,w,s,x;
  allow /dev/msm_vidc.* r,w,s,x;
  allow /dev/pvrsrvkm r,w,x,s;
  allow /dev/snd/** r,w,s,x;
  allow /dev/spdif_out.* r,w,s,x;
  allow /oem/** r,w,x,s;
  allow /system/bin/bootanimation r,w,x,s;
  allow /system/bin/toolbox r,w,x,s;
  allow /system/bin/toybox r,w,x,s;
  allowbinder servicemanager c ;
  allowbinder su c ;
  allowbinder surfaceflinger c ;
  allowcom -ipc bootanim r; #allow bootanim bootanim:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc bootanim r; #allow bootanim bootanim:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc bootanim r; #allow bootanim bootanim:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -ipc bootanim w; #allow bootanim bootanim:fifo_file { read lock getattr write ioctl open append };
  allowcom -ipc bootanim w; #allow bootanim bootanim:unix_dgram_socket { setopt setattr read lock create sendto getattr write ioctl connect shutdown bind getopt append };
  allowcom -ipc bootanim w; #allow bootanim bootanim:unix_stream_socket { connectto setopt setattr read lock create getattr accept write ioctl connect shutdown bind getopt append listen };
  allowcom -sig bootanim c; #allow bootanim bootanim:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig bootanim k; #allow bootanim bootanim:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig bootanim n; #allow bootanim bootanim:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig bootanim o; #allow bootanim bootanim:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig bootanim s; #allow bootanim bootanim:process { fork getsession sigkill sigchld setpgid setsched signal getattr setcap sigstop getcap getpgid getsched signull setrlimit };
  allowcom -sig init c; #allow bootanim init:process sigchld;
  allowdev -root /dev;
  allowpriv getsecattr;
  allowpriv getsecurity;
  allowpriv setsecurity;
  allowsvc SurfaceFlinger f ;
  allowsvc display.qservice f ;
  allowtmp -fs tmpfs -name auto r,w;
  inline "allow bootanim bootanim:dir { read search ioctl open getattr };" #path_list: 
  inline "allow bootanim bootanim:file { read lock getattr write ioctl open append };" #path_list: 
  inline "allow bootanim bootanim:lnk_file { read lock ioctl open getattr };" #path_list: 
}

