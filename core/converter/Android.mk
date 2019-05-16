LOCAL_PATH := $(call my-dir)

##
# "-x c" forces the lex/yacc files to be compiled as c the build system
# otherwise forces them to be c++. Need to also add an explicit -std because the
# build system will soon default C++ to -std=c++11.
#yacc_flags := -x c -std=gnu89

#common_cflags := \
#	-Wall -Wshadow -O2 \
#	-pipe -fno-strict-aliasing \
#	-Wno-return-type

include $(CLEAR_VARS)
LOCAL_MODULE := seedit-converter
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../../libselinux
LOCAL_CFLAGS := $(yacc_flags) $(common_cflags)
#LOCAL_LDFLAGS += -v
LOCAL_SRC_FILES := \
	action.c \
	file_label.c \
	prop_label.c \
	svc_label.c \
	initial_policy.c \
	out_macro.c \
	security_class.c \
	convert.c \
	hashtab.c \
	out_file_rule.c \
	preprocess_include.c \
	seedit-converter.c
LOCAL_STATIC_LIBRARIES := libseedit libselinux
LOCAL_MODULE_CLASS := EXECUTABLES

include $(BUILD_HOST_EXECUTABLE)
