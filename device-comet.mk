#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

SHIPPING_API_LEVEL := 34

TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DEVICE := comet
TARGET_KERNEL_DIR := device/google/$(TARGET_KERNEL_DEVICE)-kernels/$(TARGET_LINUX_KERNEL_VERSION)
TARGET_KERNEL_PLATFORM_SOURCE := google/gs-$(TARGET_LINUX_KERNEL_VERSION)

TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_RIGHT

DEVICE_PACKAGE_OVERLAYS += device/google/comet/comet/overlay
DEVICE_PACKAGE_OVERLAYS += device/google/comet/overlay-lineage

# Audio
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

include device/google/zumapro/device-shipping-common.mk

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.prebuilt.xml \
    android.hardware.bluetooth_le.prebuilt.xml

DEVICE_MANIFEST_FILE += device/google/gs-common/bcmbt/manifest_bluetooth.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += device/google/gs-common/bcmbt/compatibility_matrix.xml

# Touch
PRODUCT_PACKAGES += \
    dump_touch.sh \
    predump_gti0.sh \
    predump_gti1.sh \
    predump_touch.sh \
    touch_gti_ical

# Display
PRODUCT_PACKAGES += \
    dump_exynos_second_display

# Google RIL
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += device/google/gs-common/gril/hidl/1.7/compatibility_matrix.xml

# Increment the SVN for any official public releases
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.build.svn=40

# Set device family property for SMR
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.device_family=CT3

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.ignore_hdr_camera_layers=true

# Recovery files
PRODUCT_COPY_FILES += \
        device/google/comet/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.comet.rc

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.vendor.primarydisplay.xrr.version=2.1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.vendor.primarydisplay.blocking_zone.min_refresh_rate_by_nits=20:120,30:60,:1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.vendor.primarydisplay.vrr.expected_present.headsup_ns=30000000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.vendor.primarydisplay.vrr.expected_present.timeout_ns=500000000

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.vendor.primarydisplay.powerstats.entity_name=Inner-Display

PRODUCT_VENDOR_PROPERTIES += \
    vendor.primarydisplay.op.hs_hz=120 \
    vendor.primarydisplay.op.ns_hz=120

PRODUCT_PROPERTY_OVERRIDES += \
	vendor.camera.debug.enable_software_post_sharpen_node=false

# Display Config
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.display.png.premultiplied=true

# NFC
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
	frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
	frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml

PRODUCT_PACKAGES += \
	android.hardware.nfc-service.st \
	NfcOverlayComet

# SecureElement
PRODUCT_PACKAGES += \
	android.hardware.secure_element-service.thales

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
	frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml

# Thermal Config
PRODUCT_PACKAGES += \
	init_thermal_config

# Bluetooth HAL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.a2dp_offload.supported=true \
    persist.bluetooth.a2dp_offload.disabled=false \
    persist.bluetooth.a2dp_offload.cap=sbc-aac-aptx-aptxhd-ldac

# DCK properties based on target
PRODUCT_PROPERTY_OVERRIDES += \
    ro.gms.dck.eligible_wcc=3 \
    ro.gms.dck.se_capability=1

# Bluetotoh Auto On feature
PRODUCT_PRODUCT_PROPERTIES +=\
    bluetooth.server.automatic_turn_on=true

# Bluetooth AAC VBR
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.a2dp_aac.vbr_supported=true

# Bluetooth Super Wide Band
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.hfp.swb.supported=true

# Override BQR mask to enable LE Audio Choppy report, remove BTRT logging
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.bqr.event_mask=295006 \
    persist.bluetooth.bqr.vnd_quality_mask=16 \
    persist.bluetooth.bqr.vnd_trace_mask=0 \
    persist.bluetooth.vendor.btsnoop=false

# Support LE & Classic concurrent encryption (b/330704060)
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.ble.allow_enc_with_bredr=true

# POF
PRODUCT_PRODUCT_PROPERTIES += \
    ro.bluetooth.finder.supported=true

# declare use of spatial audio
PRODUCT_PROPERTY_OVERRIDES += \
       ro.audio.spatializer_enabled=true \
       ro.audio.spatializer_transaural_enabled_default=false \
       persist.vendor.audio.spatializer.speaker_enabled=true

# Audio CCA property
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.audio.cca.enabled=false

# HdMic Audio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.app.audio.gsenet.version=1

# PowerStats HAL
PRODUCT_SOONG_NAMESPACES += \
    device/google/comet/powerstats/comet

# UWB Overlay
PRODUCT_PACKAGES += \
	UwbOverlayCT3 \
	UwbOverlayCT3Gsi

# WiFi Overlay
PRODUCT_PACKAGES += \
	WifiOverlay2024Mid_CT3

# GRil Overlay
PRODUCT_PACKAGES += \
	GRilServiceOverlay_CT3

# Settings Overlay
PRODUCT_PACKAGES += \
    SettingsCometOverlay

# Graphics
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.set_idle_timer_ms_4619827677550801152=80
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.support_kernel_idle_timer_4619827677550801152=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.set_idle_timer_ms_4619827677550801153=1000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.support_kernel_idle_timer_4619827677550801153=false

# For GPS property
PRODUCT_VENDOR_PROPERTIES += ro.vendor.gps.pps.enabled=true

# Display
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	vendor.display.lbe.supported=1 \
	vendor.display.async_off.supported=true

# Install product specific framework compatibility matrix
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += device/google/comet/device_framework_matrix_product.xml

PRODUCT_VENDOR_PROPERTIES += \
	persist.device_config.configuration.disable_rescue_party=true

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.udfps.als_feed_forward_supported=true \
    persist.vendor.udfps.lhbm_controlled_in_hal_supported=true

# Allow external binning setting
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.allow_external_binning_setting=true

# Camera Vendor property
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.front_720P_always_binning=true

# Enable camera exif model/make reporting
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.exif_reveal_make_model=true

# Media Performance Class 14
PRODUCT_PRODUCT_PROPERTIES += ro.odm.build.media_performance_class=34

# OIS with system imu
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.ois_with_system_imu=true

# Haptics
# Placeholders for updates later, need to update:
# ro.vendor.vibrator.hal.loc.coeff.folded currently unused
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.vibrator.hal.chirp.enabled=1 \
    ro.vendor.vibrator.hal.device.mass=0.2605 \
    ro.vendor.vibrator.hal.loc.coeff.folded=3.15 \
    ro.vendor.vibrator.hal.loc.coeff=2.58 \
    persist.vendor.vibrator.hal.context.enable=false \
    persist.vendor.vibrator.hal.context.scale=60 \
    persist.vendor.vibrator.hal.context.fade=true \
    persist.vendor.vibrator.hal.context.cooldowntime=1600 \
    persist.vendor.vibrator.hal.context.settlingtime=5000

# Override Output Distortion Gain
PRODUCT_VENDOR_PROPERTIES += \
    vendor.audio.hapticgenerator.distortion.output.gain=0.45

# Hinge angle sensor
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.sensor.hinge_angle.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hinge_angle.xml

# Keyboard height ratio and bottom padding in dp for portrait mode
PRODUCT_PRODUCT_PROPERTIES += \
          ro.com.google.ime.kb_pad_port_b=11.2 \
          ro.com.google.ime.height_ratio=1.18

# Bluetooth LE Audio
# Unicast
PRODUCT_PRODUCT_PROPERTIES += \
        bluetooth.profile.bap.unicast.client.enabled=true \
        bluetooth.profile.csip.set_coordinator.enabled=true \
        bluetooth.profile.hap.client.enabled=true \
        bluetooth.profile.mcp.server.enabled=true \
        bluetooth.profile.ccp.server.enabled=true \
        bluetooth.profile.vcp.controller.enabled=true

# Bluetooth LE Audio Broadcast
PRODUCT_PRODUCT_PROPERTIES += \
	bluetooth.profile.bap.broadcast.assist.enabled=true \
	bluetooth.profile.bap.broadcast.source.enabled=true

# LE Audio switcher in developer options
PRODUCT_PRODUCT_PROPERTIES += \
        ro.bluetooth.leaudio_switcher.supported=true \

# Enable hardware offloading
PRODUCT_PRODUCT_PROPERTIES += \
        ro.bluetooth.leaudio_offload.supported=true \
        persist.bluetooth.leaudio_offload.disabled=false

# Bluetooth LE Audio CIS handover to SCO
# Set the property only for the controller couldn't support CIS/SCO simultaneously. More detailed in
# b/242908683.
PRODUCT_PRODUCT_PROPERTIES += \
        persist.bluetooth.leaudio.notify.idle.during.call=true

# Disable LE Audio dual mic SWB call support
# This may depend on the BT controller capability or the launch strategy
# For example, P22 BT chip is not able to support 32k dual mic
# P23a disabled the 32k dual mic as it is not in the phase 2 launch plan
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.leaudio.dual_bidirection_swb.supported=true

# LE Audio Unicast Allowlist
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.leaudio.allow_list=SM-R510,WF-1000XM5,SM-R630

# Telephony Satellite Feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.satellite.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.satellite.xml

# Connectivity Resources Overlay for Thread host settings
PRODUCT_PACKAGES += \
    ConnectivityResourcesOverlayCometOverride

# Thread Dispatcher enablement in Bluetooth HAL
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.thread_dispatcher.enabled=false

# Camera concurrent foldable dual front feature support
PRODUCT_PACKAGES += \
    concurrent_foldable_dual_front_xml

# Bluetooth device id
# Comet: 0x4113
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.device_id.product_id=16659

# Set support for LEA multicodec
PRODUCT_PRODUCT_PROPERTIES +=\
    bluetooth.core.le_audio.codec_extension_aidl.enabled=true

# Enable APF by default
PRODUCT_VENDOR_PROPERTIES += \
    vendor.powerhal.apf_disabled=false \
    vendor.powerhal.apf_enabled=true

# ANGLE - Almost Native Graphics Layer Engine
PRODUCT_PACKAGES += \
    ANGLE \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle

# Dumpstate
PRODUCT_PACKAGES += \
    dump_gsc.sh

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.mep.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.mep.xml \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

PRODUCT_PACKAGES += \
    EuiccSupportPixelOverlay

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Fold extensions
PRODUCT_SYSTEM_SERVER_JARS += \
    system_ext:comet-services

# GPS
PRODUCT_PACKAGES += \
    android.hardware.location.gps.prebuilt.xml

# Init
PRODUCT_PACKAGES += \
    init.recovery.comet.touch.rc

# Overlays
PRODUCT_PACKAGES += \
    PixelDisplayServiceOverlayComet

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Satellite
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/conf/allowlist_satellite.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/allowlist_satellite.xml

# Sensors
PRODUCT_PACKAGES += \
    sensors.dynamic_sensor_hal

# Wireless charging
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += device/google/gs-common/wireless_charger/compatibility_matrix.xml
