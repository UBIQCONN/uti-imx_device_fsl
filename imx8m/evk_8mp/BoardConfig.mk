# -------@block_infrastructure-------
#
# Product-specific compile-time definitions.
#

include $(CONFIG_REPO_PATH)/imx8m/BoardConfigCommon.mk

# -------@block_common_config-------
#
# SoC-specific compile-time definitions.
#

BOARD_SOC_TYPE := IMX8MP
BOARD_HAVE_VPU := true
BOARD_VPU_TYPE := hantro
HAVE_FSL_IMX_GPU2D := false
HAVE_FSL_IMX_GPU3D := true
HAVE_FSL_IMX_PXP := false
TARGET_USES_HWC2 := true
TARGET_HAVE_VULKAN := true
CFG_SECURE_IOCTRL_REGS := true

SOONG_CONFIG_IMXPLUGIN += \
                        BOARD_VPU_TYPE \
                        CFG_SECURE_IOCTRL_REGS

SOONG_CONFIG_IMXPLUGIN_BOARD_SOC_TYPE = IMX8MP
SOONG_CONFIG_IMXPLUGIN_BOARD_HAVE_VPU = true
SOONG_CONFIG_IMXPLUGIN_BOARD_VPU_TYPE = hantro
SOONG_CONFIG_IMXPLUGIN_BOARD_VPU_ONLY = false
SOONG_CONFIG_IMXPLUGIN_PREBUILT_FSL_IMX_CODEC = true
SOONG_CONFIG_IMXPLUGIN_POWERSAVE = false
SOONG_CONFIG_IMXPLUGIN_CFG_SECURE_IOCTRL_REGS = true



# -------@block_memory-------
USE_ION_ALLOCATOR := true
USE_GPU_ALLOCATOR := false

# -------@block_storage-------

TARGET_USERIMAGES_USE_EXT4 := true

# use sparse image.
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Support gpt
ifeq ($(TARGET_USE_DYNAMIC_PARTITIONS),true)
  BOARD_BPT_INPUT_FILES += $(CONFIG_REPO_PATH)/common/partition/device-partitions-13GB-ab_super.bpt
  ADDITION_BPT_PARTITION = partition-table-28GB:$(CONFIG_REPO_PATH)/common/partition/device-partitions-28GB-ab_super.bpt \
                           partition-table-dual:$(CONFIG_REPO_PATH)/common/partition/device-partitions-13GB-ab-dual-bootloader_super.bpt \
                           partition-table-28GB-dual:$(CONFIG_REPO_PATH)/common/partition/device-partitions-28GB-ab-dual-bootloader_super.bpt
else
  ifeq ($(IMX_NO_PRODUCT_PARTITION),true)
    BOARD_BPT_INPUT_FILES += $(CONFIG_REPO_PATH)/common/partition/device-partitions-13GB-ab-no-product.bpt
    ADDITION_BPT_PARTITION = partition-table-28GB:$(CONFIG_REPO_PATH)/common/partition/device-partitions-28GB-ab-no-product.bpt \
                             partition-table-dual:$(CONFIG_REPO_PATH)/common/partition/device-partitions-13GB-ab-dual-bootloader-no-product.bpt \
                             partition-table-28GB-dual:$(CONFIG_REPO_PATH)/common/partition/device-partitions-28GB-ab-dual-bootloader-no-product.bpt
  else
    BOARD_BPT_INPUT_FILES += $(CONFIG_REPO_PATH)/common/partition/device-partitions-13GB-ab.bpt
    ADDITION_BPT_PARTITION = partition-table-28GB:$(CONFIG_REPO_PATH)/common/partition/device-partitions-28GB-ab.bpt \
                             partition-table-dual:$(CONFIG_REPO_PATH)/common/partition/device-partitions-13GB-ab-dual-bootloader.bpt \
                             partition-table-28GB-dual:$(CONFIG_REPO_PATH)/common/partition/device-partitions-28GB-ab-dual-bootloader.bpt
  endif
endif

BOARD_PREBUILT_DTBOIMAGE := $(OUT_DIR)/target/product/$(PRODUCT_DEVICE)/dtbo-imx8mp.img

BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# -------@block_security-------
ENABLE_CFI=false

BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA4096
# The testkey_rsa4096.pem is copied from external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_KEY_PATH := $(CONFIG_REPO_PATH)/common/security/testkey_rsa4096.pem

BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 2

# -------@block_treble-------
# Vendor Interface manifest and compatibility
ifeq ($(POWERSAVE),true)
    DEVICE_MANIFEST_FILE := $(IMX_DEVICE_PATH)/manifest_powersave.xml
else
    DEVICE_MANIFEST_FILE := $(IMX_DEVICE_PATH)/manifest.xml
endif

DEVICE_MATRIX_FILE := $(IMX_DEVICE_PATH)/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(IMX_DEVICE_PATH)/device_framework_matrix.xml

# -------@block_wifi-------
# NXP 8997 WIFI
BOARD_WLAN_DEVICE            := nxp
WPA_SUPPLICANT_VERSION       := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER  := NL80211
BOARD_HOSTAPD_DRIVER         := NL80211
BOARD_HOSTAPD_PRIVATE_LIB               := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
# -------@block_bluetooth-------
# NXP 8997 BT
BOARD_HAVE_BLUETOOTH_NXP := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(IMX_DEVICE_PATH)/bluetooth

# -------@block_sensor-------
BOARD_USE_SENSOR_FUSION := true

# -------@block_kernel_bootimg-------
BOARD_KERNEL_BASE := 0x40400000

CMASIZE=960M
# NXP default config
BOARD_KERNEL_CMDLINE := init=/init androidboot.console=ttymxc1 androidboot.hardware=nxp firmware_class.path=/vendor/firmware loop.max_part=7

# memory config
BOARD_KERNEL_CMDLINE += transparent_hugepage=never
BOARD_KERNEL_CMDLINE += swiotlb=65536

# display config
BOARD_KERNEL_CMDLINE += androidboot.lcd_density=240 androidboot.primary_display=imx-drm

# wifi config
ifeq ($(POWERSAVE),true)
    BOARD_KERNEL_CMDLINE += androidboot.wificountrycode=CN moal.mod_para=wifi_mod_para_powersave.conf
else
    BOARD_KERNEL_CMDLINE += androidboot.wificountrycode=CN moal.mod_para=wifi_mod_para.conf
endif

# low memory device build config
ifeq ($(LOW_MEMORY),true)
BOARD_KERNEL_CMDLINE += cma=320M@0x400M-0xb80M androidboot.displaymode=720p galcore.contiguousSize=33554432
else
BOARD_KERNEL_CMDLINE += cma=$(CMASIZE)@0x400M-0x1000M
endif

# powersave config
ifeq ($(POWERSAVE),true)
    BOARD_KERNEL_CMDLINE += androidboot.powersave.usb=true androidboot.powersave.uclamp=true
endif

ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
BOARD_KERNEL_CMDLINE += androidboot.vendor.sysrq=1
endif

ifeq ($(TARGET_USE_DYNAMIC_PARTITIONS),true)
  ifeq ($(IMX_NO_PRODUCT_PARTITION),true)
    TARGET_BOARD_DTS_CONFIG := imx8mp:imx8mp-evk-no-product.dtb
  else
    # Default dual basler
    TARGET_BOARD_DTS_CONFIG := imx8mp:imx8mp-evk-dual-basler.dtb
    # basler + ov5640
    TARGET_BOARD_DTS_CONFIG += imx8mp-basler-ov5640:imx8mp-evk-basler-ov5640.dtb
    # Only ov5640
    TARGET_BOARD_DTS_CONFIG += imx8mp-ov5640:imx8mp-evk.dtb
    # Only basler
    TARGET_BOARD_DTS_CONFIG += imx8mp-basler:imx8mp-evk-basler.dtb
    # Used to support mcu image
    TARGET_BOARD_DTS_CONFIG += imx8mp-rpmsg:imx8mp-evk-rpmsg.dtb
    # Support LVDS interface
    TARGET_BOARD_DTS_CONFIG += imx8mp-lvds:imx8mp-evk-it6263-lvds-dual-channel.dtb
    # Support LVDS panel
    TARGET_BOARD_DTS_CONFIG += imx8mp-lvds-panel:imx8mp-evk-jdi-wuxga-lvds-panel.dtb
    # Support MIPI panel
    TARGET_BOARD_DTS_CONFIG += imx8mp-mipi-panel:imx8mp-evk-rm67191.dtb
    #Used to support powersave
    TARGET_BOARD_DTS_CONFIG += imx8mp-powersave:imx8mp-evk-powersave.dtb
    #Used to support powersave and mcu image
    TARGET_BOARD_DTS_CONFIG += imx8mp-powersave-non-rpmsg:imx8mp-evk-powersave-non-rpmsg.dtb
  endif
else # no dynamic parition feature
  ifeq ($(IMX_NO_PRODUCT_PARTITION),true)
    TARGET_BOARD_DTS_CONFIG := imx8mp:imx8mp-evk-no-product-no-dynamic_partition.dtb
  else
    TARGET_BOARD_DTS_CONFIG := imx8mp:imx8mp-evk-no-dynamic_partition.dtb
  endif
endif

ALL_DEFAULT_INSTALLED_MODULES += $(BOARD_VENDOR_KERNEL_MODULES)

# -------@block_sepolicy-------
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    $(CONFIG_REPO_PATH)/imx8m/system_ext_pri_sepolicy

BOARD_SEPOLICY_DIRS := \
       $(CONFIG_REPO_PATH)/imx8m/sepolicy \
       $(IMX_DEVICE_PATH)/sepolicy

