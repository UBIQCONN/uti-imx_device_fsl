$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)
ifeq ($(PRODUCT_IMX_CAR),true)
$(call inherit-product, packages/services/Car/car_product/build/car.mk)
endif
$(call inherit-product, $(TOPDIR)frameworks/base/data/sounds/AllAudio.mk)
# overrides
PRODUCT_BRAND := Android
PRODUCT_MANUFACTURER := nxp

# Android infrastructures
PRODUCT_PACKAGES += \
    CactusPlayer \
    ExtractorPkg \
    Camera \
    CubeLiveWallpapers \
    Email \
    FSLOta \
    FSLProfileApp \
    FSLProfileService \
    Gallery \
    Gallery2 \
    LegacyCamera \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    PinyinIME \
    SoundRecorder \
    VideoEditor \
    VisualizationWallpapers \
    charger_res_images \
    chat \
    ethernet \
    fsl.imx.jar \
    ip-up-vpn \
    libGLES_android \
    libRS \
    libedid \
    libfsl_hdcp_blob \
    libfsl_hdcp_blob.so \
    libion \
    libjni_pinyinime \
    libpxp \
    librs_jni \
    libstagefright_hdcp \
    libstagefright_hdcp.so \
    libubi \
    mkfs_ubifs \
    slideshow \
    ubiattach \
    ubidetach \
    ubiformat \
    ubimkvol \
    ubinfo \
    ubinize \
    ubiupdatevol \
    verity_warning_images \
    vndk-sp \
    wpa_supplicant \
    wpa_supplicant.conf

# HAL
PRODUCT_PACKAGES += \
    camera.imx \
    copybit.imx \
    gralloc.imx \
    hwcomposer.imx \
    lights.imx \
    overlay.imx \
    power.imx

# audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.imx \
    audio.r_submix.default \
    audio.usb.default \
    libaudioutils \
    libsrec_jni \
    libtinyalsa \
    tinycap \
    tinymix \
    tinyplay

# camera related libs
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    camera.device@1.0-impl \
    camera.device@3.2-impl

# sendor
PRODUCT_PACKAGES += \
    libbt-vendor \
    libbt-vendor-broadcom \
    magd

# display
PRODUCT_PACKAGES += \
    libdrm_android \
    libdisplayutils \
    libfsldisplay \
    nxp.hardware.display@1.0

# drm related lib
PRODUCT_PACKAGES += \
    drmserver \
    libdrmframework \
    libdrmframework_jni \
    libdrmpassthruplugin \
    libfwdlockengine

PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service.imx

# Vivante libdrm support
PRODUCT_PACKAGES += \
    libdrm_vivante

# Wifi AP mode
PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli


# Copy bluetooth firmware to board
PRODUCT_COPY_FILES += \
    vendor/nxp/imx-firmware/cyw-wifi-bt/ZP_CYW4339/BCM4335C0.ZP.hcd:vendor/firmware/bcm/Type_ZP.hcd \

PRODUCT_PACKAGES += \
    bt_vendor.conf

# FUSE based emulated sdcard daemon
PRODUCT_PACKAGES += \
    sdcard

# e2fsprogs libs
PRODUCT_PACKAGES += \
    mke2fs \
    libext2_blkid \
    libext2_com_err \
    libext2_e2p \
    libext2_profile \
    libext2_uuid \
    libext2fs

# ntfs-3g binary
PRODUCT_PACKAGES += \
    ntfs-3g \
    ntfsfix

# for CtsVerifier
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Debug utils
PRODUCT_PACKAGES += \
    taskset \
    sqlite3

# memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    memtrack.imx

# Freescale VPU firmware files.
PRODUCT_PACKAGES += \
    libvpu \
    vpu_fw_imx6d.bin \
    vpu_fw_imx6q.bin

# power tool
PRODUCT_PACKAGES += \
    powerdebug

# gpu debug tool
PRODUCT_PACKAGES += \
    gmem_info \
    gpu-top

# Omx related libs, please align to device/nxp/proprietary/omx/fsl-omx.mk
PRODUCT_PACKAGES += \
    ComponentRegistry.txt \
    component_register \
    component_register_ac3 \
    component_register_ddp \
    component_register_ra \
    component_register_rv \
    component_register_ms \
    component_register_wmv9 \
    contentpipe_register \
    core_register \
    fslomx.cfg \
    lib_aac_dec_v2_arm12_elinux \
    lib_aac_parser_arm11_elinux \
    lib_aac_parser_arm11_elinux.3.0 \
    lib_aacd_wrap_arm12_elinux_android \
    lib_amr_parser_arm11_elinux.3.0 \
    lib_avi_parser_arm11_elinux.3.0 \
    lib_divx_drm_arm11_elinux \
    lib_ffmpeg_arm11_elinux \
    lib_flac_dec_v2_arm11_elinux \
    lib_flac_parser_arm11_elinux \
    lib_flac_parser_arm11_elinux.3.0 \
    lib_flv_parser_arm11_elinux.3.0 \
    lib_id3_parser_arm11_elinux \
    lib_mkv_parser_arm11_elinux.3.0 \
    lib_mp3_dec_v2_arm12_elinux \
    lib_mp3_parser_arm11_elinux.3.0 \
    lib_mp3_parser_v2_arm11_elinux \
    lib_mp3d_wrap_arm12_elinux_android \
    lib_mp4_parser_arm11_elinux.3.0 \
    lib_mpg2_parser_arm11_elinux.3.0 \
    lib_nb_amr_dec_v2_arm9_elinux \
    lib_nb_amr_enc_v2_arm11_elinux \
    lib_ogg_parser_arm11_elinux.3.0 \
    lib_omx_aac_dec_v2_arm11_elinux \
    lib_omx_aac_enc_v2_arm11_elinux \
    lib_omx_aac_parser_v2_arm11_elinux \
    lib_omx_ac3toiec937_arm11_elinux \
    lib_omx_amr_dec_v2_arm11_elinux \
    lib_omx_amr_enc_v2_arm11_elinux \
    lib_omx_android_audio_render_arm11_elinux \
    lib_omx_android_audio_source_arm11_elinux \
    lib_omx_async_write_pipe_arm11_elinux \
    lib_omx_audio_fake_render_arm11_elinux \
    lib_omx_audio_processor_v2_arm11_elinux \
    lib_omx_camera_source_arm11_elinux \
    lib_omx_client_arm11_elinux \
    lib_omx_clock_v2_arm11_elinux \
    lib_omx_common_v2_arm11_elinux \
    lib_omx_core_mgr_v2_arm11_elinux \
    lib_omx_core_v2_arm11_elinux \
    lib_omx_ec3_dec_v2_arm11_elinux \
    lib_omx_flac_dec_v2_arm11_elinux \
    lib_omx_flac_parser_v2_arm11_elinux \
    lib_omx_fsl_muxer_v2_arm11_elinux \
    lib_omx_fsl_parser_v2_arm11_elinux \
    lib_omx_https_pipe_arm11_elinux \
    lib_omx_https_pipe_v2_arm11_elinux \
    lib_omx_https_pipe_v3_arm11_elinux \
    lib_omx_ipulib_render_arm11_elinux \
    lib_omx_libav_audio_dec_arm11_elinux \
    lib_omx_libav_video_dec_arm11_elinux \
    lib_omx_local_file_pipe_v2_arm11_elinux \
    lib_omx_mp3_dec_v2_arm11_elinux \
    lib_omx_mp3_enc_v2_arm11_elinux \
    lib_omx_mp3_parser_v2_arm11_elinux \
    lib_omx_osal_v2_arm11_elinux \
    lib_omx_overlay_render_arm11_elinux \
    lib_omx_pcm_dec_v2_arm11_elinux \
    lib_omx_player_arm11_elinux \
    lib_omx_res_mgr_v2_arm11_elinux \
    lib_omx_rtps_pipe_arm11_elinux \
    lib_omx_shared_fd_pipe_arm11_elinux \
    lib_omx_sorenson_dec_v2_arm11_elinux \
    lib_omx_streaming_parser_arm11_elinux \
    lib_omx_surface_render_arm11_elinux \
    lib_omx_surface_source_arm11_elinux \
    lib_omx_tunneled_decoder_arm11_elinux \
    lib_omx_udps_pipe_arm11_elinux \
    lib_omx_utils_v2_arm11_elinux \
    lib_omx_vpu_dec_v2_arm11_elinux \
    lib_omx_vpu_enc_v2_arm11_elinux \
    lib_omx_vpu_v2_arm11_elinux \
    lib_omx_wav_parser_v2_arm11_elinux \
    lib_vpu_wrapper \
    lib_wb_amr_dec_arm9_elinux \
    lib_wb_amr_enc_arm11_elinux \
    libavcodec \
    libavutil \
    libfslextractor \
    libfslxec \
    libstagefrighthw \
    libswresample \
    libxec \
    media_codecs.xml \
    media_codecs_ac3.xml \
    media_codecs_ddp.xml \
    media_codecs_ms.xml \
    media_codecs_wmv9.xml \
    media_codecs_ra.xml \
    media_codecs_rv.xml \
    media_codecs_performance.xml \
    media_profiles_V1_0.xml \
    media_codecs_google_video.xml

# Omx excluded libs
PRODUCT_PACKAGES += \
    lib_aacplus_dec_v2_arm11_elinux \
    lib_aacplusd_wrap_arm12_elinux_android \
    lib_ac3_dec_v2_arm11_elinux \
    lib_ac3d_wrap_arm11_elinux_android \
    lib_asf_parser_arm11_elinux.3.0 \
    lib_ddpd_wrap_arm12_elinux_android \
    lib_ddplus_dec_v2_arm12_elinux \
    lib_omx_ac3_dec_v2_arm11_elinux \
    lib_omx_ra_dec_v2_arm11_elinux \
    lib_omx_wma_dec_v2_arm11_elinux \
    lib_omx_wmv_dec_v2_arm11_elinux \
    lib_realad_wrap_arm11_elinux_android \
    lib_realaudio_dec_v2_arm11_elinux \
    lib_rm_parser_arm11_elinux.3.0 \
    lib_wma10_dec_v2_arm12_elinux \
    lib_wma10d_wrap_arm12_elinux_android

PRODUCT_AAPT_CONFIG := normal mdpi
# default shipping android version or8.0
PRODUCT_SHIPPING_API_LEVEL := 26

# Copy soc related config and binary to board
PRODUCT_COPY_FILES +=	\
    $(LINUX_FIRMWARE_IMX_PATH)/linux-firmware-imx/firmware/sdma/sdma-imx6q.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/imx/sdma/sdma-imx6q.bin \
    device/nxp/common/input/Dell_Dell_USB_Entry_Keyboard.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Dell_Dell_USB_Entry_Keyboard.idc \
    device/nxp/common/input/Dell_Dell_USB_Keyboard.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Dell_Dell_USB_Keyboard.idc \
    device/nxp/common/input/Dell_Dell_USB_Keyboard.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Dell_Dell_USB_Keyboard.kl \
    device/nxp/common/input/eGalax_Touch_Screen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/HannStar_P1003_Touchscreen.idc \
    device/nxp/common/input/eGalax_Touch_Screen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Novatek_NT11003_Touch_Screen.idc \
    device/nxp/common/input/eGalax_Touch_Screen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/eGalax_Touch_Screen.idc \
    device/nxp/imx6sx/etc/init.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.nxp.usb.rc \
    device/nxp/imx6sx/etc/ota.conf:$(TARGET_COPY_OUT_VENDOR)/etc/ota.conf \
    device/nxp/imx6sx/init.recovery.nxp.rc:root/init.recovery.nxp.rc \

#this must be set before including tablet-7in-hdpi-1024-dalvik-heap.mk
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=128m

#this makes imx6 wifionly devices
PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=yes

PRODUCT_PROPERTY_OVERRIDES += \
    ro.mediacomponents.package=com.nxp.extractorpkg

# Freescale multimedia parser related prop setting
# Define fsl avi/aac/asf/mkv/flv/flac format support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.FSL_AVI_PARSER=1 \
    ro.FSL_AAC_PARSER=1 \
    ro.FSL_FLV_PARSER=1 \
    ro.FSL_MKV_PARSER=1 \
    ro.FSL_FLAC_PARSER=1 \
    ro.FSL_MPG2_PARSER=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_DEFAULT_DEV_CERTIFICATE := \
    device/nxp/common/security/testkey

# In userdebug, add minidebug info the the boot image and the system server to support
# diagnosing native crashes.
ifneq (,$(filter userdebug, $(TARGET_BUILD_VARIANT)))
    # Boot image.
    PRODUCT_DEX_PREOPT_BOOT_FLAGS += --generate-mini-debug-info
    # System server and some of its services.
    # Note: we cannot use PRODUCT_SYSTEM_SERVER_JARS, as it has not been expanded at this point.
    $(call add-product-dex-preopt-module-config,services,--generate-mini-debug-info)
    $(call add-product-dex-preopt-module-config,wifi-service,--generate-mini-debug-info)
endif

# include a google recommand heap config file.
include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

-include device/google/gapps/gapps.mk
-include $(FSL_RESTRICTED_CODEC_PATH)/fsl-restricted-codec/fsl_real_dec/fsl_real_dec.mk
-include $(FSL_RESTRICTED_CODEC_PATH)/fsl-restricted-codec/fsl_ms_codec/fsl_ms_codec.mk

PRODUCT_SOONG_NAMESPACES += external/mesa3d
