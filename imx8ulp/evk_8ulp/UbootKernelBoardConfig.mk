TARGET_BOOTLOADER_POSTFIX := bin
UBOOT_POST_PROCESS := true

# u-boot target for imx8ulp_evk board
TARGET_BOOTLOADER_CONFIG := imx8ulp:imx8ulp_evk_android_defconfig
TARGET_BOOTLOADER_CONFIG += imx8ulp-trusty:imx8ulp_evk_android_trusty_defconfig
TARGET_BOOTLOADER_CONFIG += imx8ulp-trusty-secure-unlock:imx8ulp_evk_android_trusty_secure_unlock_defconfig
TARGET_BOOTLOADER_CONFIG += imx8ulp-dual:imx8ulp_evk_android_dual_defconfig
TARGET_BOOTLOADER_CONFIG += imx8ulp-trusty-dual:imx8ulp_evk_android_trusty_dual_defconfig
TARGET_BOOTLOADER_CONFIG += imx8ulp-evk-uuu:imx8ulp_evk_android_uuu_defconfig

# imx8ulp kernel defconfig
ifeq ($(IMX8ULP_USES_GKI),true)
TARGET_KERNEL_DEFCONFIG := gki_defconfig
TARGET_KERNEL_GKI_DEFCONF:= imx8ulp_gki.fragment
else
TARGET_KERNEL_DEFCONFIG := imx_v8_android_defconfig
endif
TARGET_KERNEL_ADDITION_DEFCONF := android_addition_defconfig

# absolute path is used, not the same as relative path used in AOSP make
TARGET_DEVICE_DIR := $(patsubst %/, %, $(dir $(realpath $(lastword $(MAKEFILE_LIST)))))

# define bootloader rollback index
BOOTLOADER_RBINDEX ?= 0

