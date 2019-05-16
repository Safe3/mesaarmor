{
superdomain netdomain;

allow /dev/socket/dnsproxyd r,w,s;
allow /dev/socket/fwmarkd r,w,s;
allow /dev/socket/mdnsd r,w,s;
allowcom -ipc mdnsd w; #allow netdomain mdnsd:unix_stream_socket connectto;
allowcom -ipc netd w; #allow netdomain netd:unix_stream_socket connectto;
allownet -protocol tcp -port 1024- client;
allownet -protocol tcp -port 1024- server;
allownet -protocol udp -port 1024- server;
}

