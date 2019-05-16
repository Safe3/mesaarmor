# README for MesaArmor 0.1 (seedit porting for Android)

SELinux Policy Editor (seedit, http://seedit.sourceforge.net/) is a tool to make
SELinux easy, by converting policy written in Simplified Policy Description
Language (SPDL) to SELinux policy. SPDL simplifies policy development through
following two features:

* Hiding labels:
  SPDL uses file path/name, port number, property name, Android service names to
  configure access control policy instead of using types directly. Thus the
  policy developer does not need to update/maintain contexts files which map
  path/name, protperty name, service names to labels.

* Reduce number of permissions:
  SELinux provides fine granularity permission control. in another word, there
  are too many permissions in SELinux. SPDL reduces number of permissions by
  removing permissions and integrating permissions. Permissions that does not
  have security impact are removed (i.e., by allowing these permissions for all
  domains). The set of related permissions are integrated as one permission. For
  detail of what kind of permissions are removed, integrated see
  core/config/base_policy/spdl_spec.xml.

MesaArmor is the ported seedit for Android. For SPDL specification, please refer
to docs/spdl_spec/spdl_spec.tex.

## Examples: Policy snippet comparison between SEAndroid and MesaArmor
### File Access
* SEAndroid
```
# In adbd.te
allow adbd storage_file:dir r_dir_perms;
allow adbd storage_file:lnk_file r_file_perms;
allow adbd mnt_user_file:dir r_dir_perms;
allow adbd mnt_user_file:lnk_file r_file_perms;

# in file_contexts
/mnt/user(/.*)? u:object_r:mnt_user_file:s0
/mnt/runtime(/.*)? u:object_r:storage_file:s0
/storage|(/.*)? u:object_r:storage_file:s0
```
* MesaArmor
```
# in adbd.sp
allow /mnt/runtime/** r,s;
allow /mnt/user/** r,s;
allow /storage/** r,s;

# no need to update file_contexts
```

### Property
* SEAndroid
```
# In adbd.te
set_prop(adbd, shell_prop)
set_prop(adbd, powerctl_prop)
set_prop(adbd, ffs_prop)

# In property_contexts
log. u:object_r:shell_prop:s0
service.adb.root u:object_r:shell_prop:s0
service.adb.tcp.port u:object_r:shell_prop:s0
sys.powerctl u:object_r:powerctl_prop:s0
sys.usb.ffs. u:object_r:ffs_prop:s0
```
* MesaArmor
```
# In adbd.sp
allowprop log. ;
allowprop service.adb.root ;
allowprop service.adb.tcp.port ;
allowprop sys.powerctl ;
allowprop sys.usb.ffs. ;

# no need to update property_contexts

```

### Netlink
* SEAndroid
```
# In netd.te
allow netd self:netlink_kobject_uevent_socket create_socket_perms;
allow netd self:netlink_route_socket nlmsg_write;
allow netd self:netlink_nflog_socket create_socket_perms;
allow netd self:netlink_socket create_socket_perms;
```
* MesaArmor
```
# in netd.sp
allowpriv netlink;
```
### Android service
* SEAndroid
```
# In adbd.te
allow adbd surfaceflinger_service:service_manager find;

# In service_contexts
display.qservice u:object_r:surfaceflinger_service:s0
SurfaceFlinger u:object_r:surfaceflinger_service:s0
```
* MesaArmor
```
# In adbd.sp
allowsvc SurfaceFlinger f ;
allowsvc display.qservice f ;

# no need to update service_contexts
```

## Getting Started
MesaArmor 0.1 is tested on Android 6/Nexus 5 (hammerhead) only. Other devices
and Android versions are not supported yet.

### Build environment setup.
  1. Setup environment for AOSP
    (https://source.android.com/setup/build/downloading) to download AOSP source
    code.
  2. Find correct branch tag
    (https://source.android.com/setup/start/build-numbers#source-code-tags-and-builds).
    For Nexus 5 (hammerhead), run following command to get Android 6.0.1
    (M4B30Z, Dec 2016) $ repo init -u
    https://android.googlesource.com/platform/manifest -b android-6.0.1_r77
  3. Download drivers for hammerhead
    (https://developers.google.com/android/drivers#hammerheadm4b30z)
  4. Build AOSP
  ```
    $ source build/envsetup.sh
    $ lunch aosp_hammerhead-userdebug
    $ make
  ```
### Convert AOSP SEAndroid policy to SP (Simplified Policy).
  1. Download MesaArmor source code and copy to aosp/external/
  2. build and install MesaArmor
  ```
    $ cd aosp/external/mesaarmor/core
    $ mm
  ```
  3. convert SEAndroid policy file to SP
  ```
    $ cd aosp/external/mesaarmor/policy/src;
    $ sepol2sp.py hammerhead
    $ mkdir simplified_policy.hammerhead
    $ cp -fr auto/root/* simplified_policy.hammerhead/
  ```

### Adjust SP files according to your needs.
  * Update/add sp files in simplified_policy.hammerhead/

### Build SP and replace SEAndroid policy file
```
  $ rm -fr aosp/out/target/product/hammerhead/obj/ETC/test_sepolicy_intermediates/*;
  $ rm -fr aosp/out/target/product/hammerhead/obj/ETC/test_sepolicy_recovery_intermediates/*;
  $ mm
```

### Repackage AOSP binary
```
  $ cd aosp/
  $ make
```

### Flash new AOSP binary to device
```
  $ adb reboot bootloader
  $ fastboot flash system system.img
  $ fastboot flash boot boot.img
  $ fastboot flash recovery recovery.img
  $ fastboot flash cache cache.img
  $ fastboot erase userdata
  $ fastboot flash userdata userdata.img
  $ fastboot reboot
```

## Running the tests
Run following command to see if there are any avc deny log.
```
  $ adb logcat | grep avc
```

## Contributing
MesaArmor is in the very early stage of porting seedit to Android platform. Some
important components (e.g., audit2spdl, GUI)are still work-in-progress. Support
for other devices and different Android versions relies on the whole community,
and you are very welcome to contribute to the MesaArmor project.

You can get involved in various forms:

* Try to use MesaArmor, report issue, enhancement suggestions, etc
* Contribute to MesaArmor: optimize development process, improve documents,
  close issues, etc
* Contribute to core components of MesaArmor: improving audit2spdl, GUI, etc
* Port and test MesaArmor on other Android devices

## Maintainer

  - An Liu `<liuan03@baidu.com>`

## Steering Committee

  - Tao Wei
  - Yulong Zhang

## License

MesaArmor is provided under the [GPL License](COPYING).

