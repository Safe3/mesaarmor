LOCAL_PATH := $(call my-dir)


##
# "-x c" forces the lex/yacc files to be compiled as c the build system
# otherwise forces them to be c++. Need to also add an explicit -std because the
# build system will soon default C++ to -std=c++11.
yacc_flags := -x c -std=gnu89

#common_cflags := \
#	-Wall -Wshadow -O2 \
#	-pipe -fno-strict-aliasing \
#	-Wno-return-type

include $(CLEAR_VARS)
LOCAL_MODULE := libseedit
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../include/
LOCAL_CFLAGS := $(yacc_flags) $(common_cflags)
LOCAL_SRC_FILES := \
	middle_lang_parse.y \
	middle_lang_scan.l \
	common.c \
	parse.c
LOCAL_MODULE_CLASS := STATIC_LIBRARIES

include $(BUILD_HOST_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libseedit
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../include/
LOCAL_CFLAGS := $(yacc_flags) $(common_cflags)
LOCAL_SRC_FILES := \
	middle_lang_parse.y \
	middle_lang_scan.l \
	common.c \
	parse.c
LOCAL_MODULE_CLASS := STATIC_LIBRARIES

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libaudit2spdl.py
LOCAL_SRC_FILES := python/seedit/libaudit2spdl.py
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
LOCAL_MODULE_TAGS := optional

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := libseedit.py
LOCAL_SRC_FILES := python/seedit/libseedit.py
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
LOCAL_MODULE_TAGS := optional

include $(BUILD_PREBUILT)


