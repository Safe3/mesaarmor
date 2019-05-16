LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

#sp_path := $(LOCAL_PATH)/simplified_policy.hammerhead
sp_path := $(LOCAL_PATH)
sp_name := simplified_policy.$(TARGET_DEVICE)/root
sp_recovery_name := simplified_policy.$(TARGET_DEVICE)/recovery/root
aosp_sepolicy_path := $(LOCAL_PATH)/../../../sepolicy
sepolicy_recovery_inte := $(TARGET_OUT_INTERMEDIATES)/ETC/sepolicy.recovery_intermediates/sepolicy.recovery
CONVERTER := seedit-converter
CORE_PATH := $(LOCAL_PATH)/../../core
CONFIG_PATH := $(CORE_PATH)/config
BASEPOLICYDIR := $(LOCAL_PATH)/../../core/config/base_policy
SPDLSPEC := $(BASEPOLICYDIR)/spdl_spec.xml

# SELinux policy version.
# Must be <= /sys/fs/selinux/policyvers reported by the Android kernel.
# Must be within the compatibility range reported by checkpolicy -V.
POLICYVERS ?= 30

MLS_SENS=1
MLS_CATS=1024

ifdef BOARD_SEPOLICY_REPLACE
$(error BOARD_SEPOLICY_REPLACE is no longer supported; please remove from your BoardConfig.mk or other .mk file.)
endif

ifdef BOARD_SEPOLICY_IGNORE
$(error BOARD_SEPOLICY_IGNORE is no longer supported; please remove from your BoardConfig.mk or other .mk file.)
endif

ifdef BOARD_SEPOLICY_UNION
$(warning BOARD_SEPOLICY_UNION is no longer required - all files found in BOARD_SEPOLICY_DIRS are implicitly unioned; please remove from your BoardConfig.mk or other .mk file.)
endif

# Builds paths for all policy files found in BOARD_SEPOLICY_DIRS.
# $(1): the set of policy name paths to build
build_policy = $(foreach type, $(1), $(wildcard $(addsuffix /$(type), $(aosp_sepolicy_path) $(BOARD_SEPOLICY_DIRS))))

sepolicy_build_files1 := security_classes \
                        initial_sids \
                        access_vectors \
                        global_macros \
                        neverallow_macros \
                        mls_macros \
                        mls \
                        policy_capabilities \
                        te_macros \
                        attributes \
                        ioctl_macros

sepolicy_build_files2 := roles \
                        users \
                        initial_sid_contexts \
                        fs_use \
                        genfs_contexts \
                        port_contexts

FLIST1 := $(call build_policy, $(sepolicy_build_files1))
FLIST2 := $(call build_policy, $(sepolicy_build_files2))

##################################
include $(CLEAR_VARS)

LOCAL_MODULE := test_sepolicy
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)

include $(BUILD_SYSTEM)/base_rules.mk

sepolicy_policy.conf := $(intermediates)/policy.conf
$(sepolicy_policy.conf): PRIVATE_MLS_SENS := $(MLS_SENS)
$(sepolicy_policy.conf): PRIVATE_MLS_CATS := $(MLS_CATS)
$(sepolicy_policy.conf) : $(FLIST1) $(FLIST2)
	@mkdir -p $(dir $@)
	$(CONFIG_PATH)/scripts/genmacro.py -i $(SPDLSPEC) -m macro -o $(BASEPOLICYDIR)/seedit_macros.te
	$(CONFIG_PATH)/scripts/genmacro.py -i $(SPDLSPEC) -m unsupported > $(BASEPOLICYDIR)/unsupported.te
	m4 -s $(sp_path)/$(sp_name)/*.sp > $(dir $@)all.sp
	$(CONVERTER) -i $(dir $@)all.sp -o $(dir $@) -b $(BASEPOLICYDIR) -a $(aosp_sepolicy_path) -I $(sp_path)/$(sp_name)/include
	m4 -D mls_num_sens=$(PRIVATE_MLS_SENS) -D mls_num_cats=$(PRIVATE_MLS_CATS) \
		-D target_build_variant=$(TARGET_BUILD_VARIANT) \
		-s $(dir $@)all.te > $@
	$(hide) sed '/dontaudit/d' $@ > $@.dontaudit

$(LOCAL_BUILT_MODULE) : $(sepolicy_policy.conf) $(HOST_OUT_EXECUTABLES)/checkpolicy
	@mkdir -p $(dir $@)
	$(hide) $(HOST_OUT_EXECUTABLES)/checkpolicy -M -c $(POLICYVERS) -o $@ $<
	$(hide) $(HOST_OUT_EXECUTABLES)/checkpolicy -M -c $(POLICYVERS) -o $(dir $<)$(notdir $@).dontaudit $<.dontaudit
	cp $(dir $@)file_contexts.m4 $(TARGET_ROOT_OUT)/file_contexts
	cp $(dir $@)property_contexts.m4 $(TARGET_ROOT_OUT)/property_contexts
	cp $(dir $@)service_contexts.m4 $(TARGET_ROOT_OUT)/service_contexts
	cp $(dir $@)test_sepolicy $(TARGET_ROOT_OUT)/sepolicy

built_sepolicy := $(LOCAL_BUILT_MODULE)
sepolicy_policy.conf :=

##################################
include $(CLEAR_VARS)

LOCAL_MODULE := test_sepolicy_recovery
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := eng

include $(BUILD_SYSTEM)/base_rules.mk

sepolicy_policy.conf := $(intermediates)/policy_recovery.conf
$(sepolicy_policy.conf): PRIVATE_MLS_SENS := $(MLS_SENS)
$(sepolicy_policy.conf): PRIVATE_MLS_CATS := $(MLS_CATS)
$(sepolicy_policy.conf) : $(FLIST1) $(FLIST2)
	@mkdir -p $(dir $@)
	$(CONFIG_PATH)/scripts/genmacro.py -i $(SPDLSPEC) -m macro -o $(BASEPOLICYDIR)/seedit_macros.te
	$(CONFIG_PATH)/scripts/genmacro.py -i $(SPDLSPEC) -m unsupported > $(BASEPOLICYDIR)/unsupported.te
	m4 -s $(sp_path)/$(sp_recovery_name)/*.sp > $(dir $@)all.sp
	$(CONVERTER) -i $(dir $@)all.sp -o $(dir $@) -b $(BASEPOLICYDIR) -a $(aosp_sepolicy_path) -I $(sp_path)/$(sp_recovery_name)/include
	m4 -D mls_num_sens=$(PRIVATE_MLS_SENS) -D mls_num_cats=$(PRIVATE_MLS_CATS) \
		-D target_build_variant=$(TARGET_BUILD_VARIANT) \
		-D target_recovery=true \
		-s $(dir $@)all.te > $@

$(LOCAL_BUILT_MODULE) : $(sepolicy_policy.conf) $(HOST_OUT_EXECUTABLES)/checkpolicy
	@mkdir -p $(dir $@)
	$(hide) $(HOST_OUT_EXECUTABLES)/checkpolicy -M -c $(POLICYVERS) -o $@ $<
	cp $(dir $@)file_contexts.m4 $(TARGET_RECOVERY_ROOT_OUT)/file_contexts
	cp $(dir $@)property_contexts.m4 $(TARGET_RECOVERY_ROOT_OUT)/property_contexts
	cp $(dir $@)service_contexts.m4 $(TARGET_RECOVERY_ROOT_OUT)/service_contexts
	cp $(dir $@)test_sepolicy_recovery $(sepolicy_recovery_inte)

built_sepolicy_recovery := $(LOCAL_BUILT_MODULE)
sepolicy_policy_recovery.conf :=


###################################
#include $(CLEAR_VARS)
#
#LOCAL_MODULE := file_contexts
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
#
#include $(BUILD_SYSTEM)/base_rules.mk
#
#ALL_FC_FILES := $(call build_policy, file_contexts)
#
#$(LOCAL_BUILT_MODULE): PRIVATE_SEPOLICY := $(built_sepolicy)
#$(LOCAL_BUILT_MODULE):  $(ALL_FC_FILES) $(built_sepolicy) $(HOST_OUT_EXECUTABLES)/checkfc
#	@mkdir -p $(dir $@)
#	$(hide) m4 -s $(ALL_FC_FILES) > $@
#	$(hide) $(HOST_OUT_EXECUTABLES)/checkfc $(PRIVATE_SEPOLICY) $@
#
#built_fc := $(LOCAL_BUILT_MODULE)

###################################
#include $(CLEAR_VARS)
#LOCAL_MODULE := seapp_contexts
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
#
#include $(BUILD_SYSTEM)/base_rules.mk
#
#seapp_contexts.tmp := $(intermediates)/seapp_contexts.tmp
#$(seapp_contexts.tmp): $(call build_policy, seapp_contexts)
#	@mkdir -p $(dir $@)
#	$(hide) m4 -s $^ > $@
#
#$(LOCAL_BUILT_MODULE): PRIVATE_SEPOLICY := $(built_sepolicy)
#$(LOCAL_BUILT_MODULE) : $(seapp_contexts.tmp) $(built_sepolicy) $(HOST_OUT_EXECUTABLES)/checkseapp
#	@mkdir -p $(dir $@)
#	$(HOST_OUT_EXECUTABLES)/checkseapp -p $(PRIVATE_SEPOLICY) -o $@ $<
#
#built_sc := $(LOCAL_BUILT_MODULE)
#seapp_contexts.tmp :=
#
###################################
#include $(CLEAR_VARS)
#
#LOCAL_MODULE := property_contexts
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
#
#include $(BUILD_SYSTEM)/base_rules.mk
#
#ALL_PC_FILES := $(call build_policy, property_contexts)
#
#$(LOCAL_BUILT_MODULE): PRIVATE_SEPOLICY := $(built_sepolicy)
#$(LOCAL_BUILT_MODULE):  $(ALL_PC_FILES) $(built_sepolicy) $(HOST_OUT_EXECUTABLES)/checkfc
#	@mkdir -p $(dir $@)
#	$(hide) m4 -s $(ALL_PC_FILES) > $@
#	$(hide) $(HOST_OUT_EXECUTABLES)/checkfc -p $(PRIVATE_SEPOLICY) $@
#
#built_pc := $(LOCAL_BUILT_MODULE)
#
###################################
#include $(CLEAR_VARS)
#
#LOCAL_MODULE := service_contexts
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
#
#include $(BUILD_SYSTEM)/base_rules.mk
#
#ALL_SVC_FILES := $(call build_policy, service_contexts)
#
#$(LOCAL_BUILT_MODULE): PRIVATE_SEPOLICY := $(built_sepolicy)
#$(LOCAL_BUILT_MODULE):  $(ALL_SVC_FILES) $(built_sepolicy) $(HOST_OUT_EXECUTABLES)/checkfc
#	@mkdir -p $(dir $@)
#	$(hide) m4 -s $(ALL_SVC_FILES) > $@
#	$(hide) $(HOST_OUT_EXECUTABLES)/checkfc -p $(PRIVATE_SEPOLICY) $@
#
#built_svc := $(LOCAL_BUILT_MODULE)
#
###################################
#include $(CLEAR_VARS)
#
#LOCAL_MODULE := mac_permissions.xml
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/security
#
#include $(BUILD_SYSTEM)/base_rules.mk
#
## Build keys.conf
#mac_perms_keys.tmp := $(intermediates)/keys.tmp
#$(mac_perms_keys.tmp) : $(call build_policy, keys.conf)
#	@mkdir -p $(dir $@)
#	$(hide) m4 -s $^ > $@
#
#ALL_MAC_PERMS_FILES := $(call build_policy, $(LOCAL_MODULE))
#
#$(LOCAL_BUILT_MODULE) : $(mac_perms_keys.tmp) $(HOST_OUT_EXECUTABLES)/insertkeys.py $(ALL_MAC_PERMS_FILES)
#	@mkdir -p $(dir $@)
#	$(hide) DEFAULT_SYSTEM_DEV_CERTIFICATE="$(dir $(DEFAULT_SYSTEM_DEV_CERTIFICATE))" \
#		$(HOST_OUT_EXECUTABLES)/insertkeys.py -t $(TARGET_BUILD_VARIANT) -c $(TOP) $< -o $@ $(ALL_MAC_PERMS_FILES)
#
#mac_perms_keys.tmp :=
###################################
#include $(CLEAR_VARS)
#
#LOCAL_MODULE := selinux_version
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
#
#include $(BUILD_SYSTEM)/base_rules.mk
#$(LOCAL_BUILT_MODULE) : $(built_sepolicy) $(built_pc) $(built_fc) $(built_sc) $(built_svc)
#	@mkdir -p $(dir $@)
#	$(hide) echo -n $(BUILD_FINGERPRINT) > $@
#
###################################

build_policy :=
sepolicy_build_files :=
built_sepolicy :=
built_sc :=
built_fc :=
built_pc :=
built_svc :=

include $(call all-makefiles-under,$(LOCAL_PATH))
