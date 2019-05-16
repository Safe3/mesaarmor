adb root
echo "generate dirlist.txt"
adb shell find / -type d | grep ^'/' > dirlist.txt
echo "generate filelist.txt"
adb shell find / -type f | grep ^'/' > filelist.txt
