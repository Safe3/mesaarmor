{
superdomain binderservicedomain;
allow /data/local/tmp/** r,w,s;
allow /dev/console r,w,x,s;
allow /dev/pts r,w,x,s;
allow /mnt/expand/[^/]+/local/tmp/** r,w,s;
allowbinder bluetooth t ;
allowbinder dumpstate t ;
allowbinder isolated_app t ;
allowbinder keystore c ;
allowbinder mediaserver t ;
allowbinder nfc t ;
allowbinder platform_app t ;
allowbinder radio t ;
allowbinder shared_relro t ;
allowbinder shell t ;
allowbinder su t ;
allowbinder surfaceflinger t ;
allowbinder system_app t ;
allowbinder system_server t ;
allowbinder untrusted_app t ;
allowcom -ipc appdomain w; #allow binderservicedomain appdomain:fifo_file write;
allowcom -ipc dumpstate r; #allow binderservicedomain dumpstate:unix_stream_socket { read write getattr getopt };
allowcom -ipc dumpstate w; #allow binderservicedomain dumpstate:unix_stream_socket { read write getattr getopt };
allowdev -pts devpts r;
allowdev -pts devpts w;

allowdev -root /dev;
allowks keystore i,g,s ;
allowpriv getsecurity;
allowpriv setsecurity;
allowsvc android.security.keystore f ;
allowsvc permission f ;
}

