{
superdomain bluetoothdomain;
allowcom -ipc bluetooth r; #allow bluetoothdomain bluetooth:unix_stream_socket { setopt read getattr write ioctl shutdown getopt };
allowcom -ipc bluetooth w; #allow bluetoothdomain bluetooth:unix_stream_socket { setopt read getattr write ioctl shutdown getopt };
}

