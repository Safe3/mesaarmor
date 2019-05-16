LOCAL_PATH := $(call my-dir)

##############################
include $(CLEAR_VARS)

LOCAL_MODULE := seedit-cross.sh
LOCAL_SRC_FILES := seedit-cross.sh
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
LOCAL_MODULE_TAGS := optional

include $(BUILD_PREBUILT)

##############################
include $(CLEAR_VARS)

LOCAL_MODULE := seedit-rbac.sh
LOCAL_SRC_FILES := seedit-rbac.sh
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
LOCAL_MODULE_TAGS := optional

include $(BUILD_PREBUILT)

##############################
include $(CLEAR_VARS)

LOCAL_MODULE := seedit-unconfined.py
LOCAL_SRC_FILES := seedit-unconfined.py
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
LOCAL_MODULE_TAGS := optional

include $(BUILD_PREBUILT)

#############################
include $(CLEAR_VARS)

LOCAL_MODULE := audit2spdl.py
LOCAL_SRC_FILES := audit2spdl.py
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
LOCAL_MODULE_TAGS := optional

include $(BUILD_PREBUILT)

#############################
include $(CLEAR_VARS)

LOCAL_MODULE := sepol2sp.py
LOCAL_SRC_FILES := sepol2sp.py
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
LOCAL_MODULE_TAGS := optional

include $(BUILD_PREBUILT)

##############################
include $(CLEAR_VARS)

LOCAL_MODULE := seedit-load.py
LOCAL_SRC_FILES := seedit-load.py
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
LOCAL_MODULE_TAGS := optional

include $(BUILD_PREBUILT)

##############################
include $(CLEAR_VARS)

LOCAL_MODULE := seedit-template.py
LOCAL_SRC_FILES := seedit-template.py
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
LOCAL_MODULE_TAGS := optional

include $(BUILD_PREBUILT)

